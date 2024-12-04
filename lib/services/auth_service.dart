import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/api.const.dart';

class AuthService {
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
        return true;
      }

      log(response.body);

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
