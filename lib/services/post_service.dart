import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oncampus/constants/api.const.dart';
import 'package:oncampus/constants/hive.const.dart';

class PostService {
  Future<bool> createPost(String text, bool public, List<File> images) async {
    try {
      const url = "$baseUrl/posts/create";
      final access = getAccessToken();
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $access',
          },
          body: jsonEncode({
            'text': text,
            'public': public,
            'images': images.map((e) => e.path).toList(),
          }));

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body) as List<String>;

        log(data.toString());

        // Implement Flutter Isolate for post Images
        if (images.isNotEmpty) {
          final result = await postImages(images, data);
          if (!result) {
            return false;
          }
        }

        return true;
      }

      return true;
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
        throw Exception('Token is null');
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
          log("Error Occured While Uploading images", error: response.statusCode);
          return false;
        }
      }

      return true;
    } catch (e) {
      log("Error Occured While Uploading images", error: e);
      return false;
    }
  }
}
