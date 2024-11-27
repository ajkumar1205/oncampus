import 'package:flutter/material.dart';
import 'package:oncampus/constants/colors.const.dart';
import 'package:oncampus/constants/padding.const.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 2 * kDefaultPadding,
          vertical: 2 * kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container()),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Expanded(child: Container()),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username or email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                filled: true,
                fillColor: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              child: const Text(
                "Verify Mail",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "doesn't have account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Continue without login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
