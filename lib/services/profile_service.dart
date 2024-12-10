import 'dart:developer';

import 'package:oncampus/constants/api.const.dart';
import 'package:oncampus/models/profile.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:oncampus/services/post_service.dart';

class ProfileService {
  final _post = PostService();
  Future<List<Profile>> searchProfiles(String query) async {
    try {
      // Fetch the profiles from the API

      log("Searching for profiles with query: $query");
      final response = await http.get(
        Uri.parse('$baseUrl/profiles/search?string=$query'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_post.getAccessToken()}',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        log(data.toString());

        List<Profile> profiles = [];

        for (var item in data) {
          final profile = Profile.fromJson(item as Map<String, dynamic>);
          profiles.add(profile);
        }

        return profiles;
      }

      log("Response Code in fetching profiles: ${response.statusCode}");
      log("Error while fetching profiles: ${response.body}");

      return [];
    } catch (e) {
      log("Error while fetchinf users", error: e);
      // Log the error and return an empty list
      return [];
    }
  }
}
