import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oncampus/constants/api.const.dart';
import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/models/post.model.dart';

class PostService {
  Future<bool> createPost(String text, bool public) async {
    try {
      log("Creating Post..................");
      const url = "$baseUrl/posts/create";
      final access = getAccessToken();
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $access',
          },
          body: jsonEncode({'text': text, 'public': public}));

      if (response.statusCode == 201) {
        final data = response.body;

        log(data.toString());

        return true;
      }

      log("Error Occured While Creating Post", error: response.statusCode);

      return false;
    } catch (e) {
      // Log the error and return false
      return false;
    }
  }

  String getAccessToken() {
    if (Hive.isBoxOpen(config)) {
      final box = Hive.box(config);
      final token = box.get('access') as String?;
      if (token == null) {
        throw Exception("Token is null");
      }
      return token;
    } else {
      throw Exception('Hive box is not open');
    }
  }

  Future<bool> postImages(List<File> images, List<String> urls) async {
    try {
      for (int i = 0; i < images.length; i++) {
        final imageUrl = urls[i];
        final imageBytes = await images[i].readAsBytes();
        String type = images[i].path.split(".").last;
        if (type == "jpg") {
          type = "jpeg";
        }
        final response = await http.put(
          Uri.parse(imageUrl),
          headers: {
            'Content-Type': "image/$type", // Adjust based on your image type
            'Content-Length': imageBytes.length.toString(),
          },
          body: imageBytes,
        );

        if (response.statusCode != 200) {
          log("Error Occured While Uploading images",
              error: response.statusCode);
          return false;
        }
      }

      return true;
    } catch (e) {
      log("Error Occured While Uploading images", error: e);
      return false;
    }
  }

  Future<List<Post>> getAllPosts() async {
    try {
      final access = getAccessToken();
      final response = await http.get(
        Uri.parse("$baseUrl/posts/list?count=30"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $access',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        List<Post> posts = [];
        for (final post in data) {
          posts.add(Post.fromJson(post as Map<String, dynamic>));
        }

        return posts;
      }

      return [];
    } catch (e) {
      log("Error occured In fetching all posts", error: e);
      return [];
    }
  }

  Future<List<Post>> getFriendsPosts() async {
    try {
      final access = getAccessToken();
      final response = await http.get(
        Uri.parse("$baseUrl/posts/list/friends?count=30"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $access',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        List<Post> posts = [];
        for (final post in data) {
          posts.add(Post.fromJson(post as Map<String, dynamic>));
        }

        return posts;
      }

      return [];
    } catch (e) {
      log("Error occured in fetching friends posts", error: e);
      return [];
    }
  }

  // Future<dynamic> getComments(String postId) {

  // }
}
