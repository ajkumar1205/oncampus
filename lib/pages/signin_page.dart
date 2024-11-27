import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'groupchat_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: user,
            decoration: const InputDecoration(
              hintText: 'Username or email',
            ),
          ),
          TextField(
            controller: pass,
            decoration: const InputDecoration(
              hintText: 'Enter your Password',
            ),
          ),
          TextButton(
            onPressed: () async {
              http.Response? response;
              if (user.text.isNotEmpty && pass.text.isNotEmpty) {
                response = await http.post(
                  Uri.parse("http://localhost:3000/user/token"),
                  body: {
                    "username": user.text.trim(),
                    "password": pass.text.trim(),
                  },
                );
              }
              if (response != null && response.statusCode == 200) {
                final body = jsonDecode(response.body);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GroupChatPage(),
                ));
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
