import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AuthService {
  static Future<bool> postData(
      String firstName,
      String lastName,
      String userName,
      String email,
      String password,
      String rollNumber,
      DateTime? dob) async {
    try {
      String formattedDate =
          dob != null ? DateFormat('yyyy-MM-dd').format(dob) : '';
      final response = await http.post(
        Uri.parse('https://oncampus.ajaythakur.tech/auth/register'),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'user_name': userName,
          'email': email,
          'password': password,
          'roll': rollNumber,
          'dob': formattedDate,
        },
      );

      if (response.statusCode == 201) {
        return true; // Successful
      } else {
        print("..........................${response.body}");

        return false; // Failed
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
