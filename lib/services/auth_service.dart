import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/models/user.model.dart';

import '../constants/api.const.dart';

class AuthService {
  Future<String?> login({
    required String user,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user': user.trim(),
          'password': password.trim(),
        }),
      );

      log(response.toString());

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        log(data.toString());
        final tokens = data['tokens'] as Map<String, dynamic>;
        final user = data['user'] as Map<String, dynamic>;

        if (Hive.isBoxOpen(config)) {
          final box = Hive.box(config);
          box.put('refresh', tokens['refresh_token'] as String);
          box.put('access', tokens['access_token'] as String);
          User newuser = User.fromJson(user);
          newuser.isActive = true;

          Hive.box(config).put(currentUser, newuser);
        } else {
          final box = await Hive.openBox(config);
          box.put('refresh', tokens['refresh_token']);
          box.put('access', tokens['access_token']);
          User newuser = User.fromJson(user);
          newuser.isActive = true;

          Hive.box(config).put(currentUser, newuser);
        }

        return null;
      } else {
        // Check if the response is JSON or plain text
        final contentType = response.headers['Content-Type'];
        if (contentType != null && contentType.contains('application/json')) {
          log(response.body);
          return jsonDecode(response.body);
        } else {
          log(response.body);
          return response.body;
        }
      }
    } catch (e) {
      log("Something went wrong while login", error: e);
      return 'An error occurred';
    }
  }

  Future<Map<String, dynamic>> register({
    required String firstname,
    required String lastname,
    required String username,
    required String email,
    required String password,
    required String dob,
    required String roll,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'first_name': firstname,
          'last_name': lastname,
          'username': username,
          'email': email,
          'password': password,
          'dob': dob,
          'roll': roll,
        }),
      );

      log(response.toString());

      if (response.statusCode == 201) {
        return {'status': 'success', 'data': jsonDecode(response.body)};
      } else {
        // Check if the response is JSON or plain text
        final contentType = response.headers['Content-Type'];
        if (contentType != null && contentType.contains('application/json')) {
          log(response.body);
          return {'status': 'error', 'message': jsonDecode(response.body)};
        } else {
          log(response.body);
          return {'status': 'error', 'message': response.body};
        }
      }
    } catch (e) {
      log(e.toString());
      return {'status': 'error', 'message': 'An error occurred'};
    }
  }

  Future<bool> sendOtp(String email) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/auth/send-otp"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"email": email}));

      if (response.statusCode == 200) {
        return true;
      }

      log(response.body);

      return false;
    } catch (e) {
      log("Error occured", error: e);
      return false;
    }
  }

  Future<bool> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/verify-otp"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        final refresh = data['tokens']['refresh_token'] as String?;
        final access = data['tokens']['access_token'] as String?;

        log(data.toString());

        log(refresh ?? "No token");
        log(access ?? "No token");
        print(
            "========================================================================================");
        print(
            "=========================================================================================");
        print(refresh);
        print(access);
        print(
            "=========================================================================================");
        print(
            "=========================================================================================");

        if (Hive.isBoxOpen(config)) {
          final box = Hive.box(config);
          box.put('refresh', refresh);
          box.put('access', access);
        } else {
          final box = await Hive.openBox(config);
          box.put('refresh', refresh);
          box.put('access', access);
        }

        final user = Hive.box(config).get(currentUser) as User;
        user.isActive = true;
        final updatedUser = User.from(user);
        updatedUser.isActive = true;

        Hive.box(config).put(currentUser, updatedUser);

        return true;
      }

      log(response.body, error: response.statusCode);

      return false;
    } catch (e) {
      log(e.toString());
      log("Error occured", error: e);
      return false;
    }
  }
}
