import 'package:flutter/material.dart';
import 'package:oncampus/constants/colors.const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Container()),
            Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Expanded(child: Container()),
            SizedBox(height: screenHeight * 0.05),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
              decoration: InputDecoration(
                hintText: 'Username or email',
                hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                filled: true,
                fillColor: kPrimaryColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
              decoration: InputDecoration(
                hintText: 'Enter  your Password',
                hintStyle: TextStyle(fontSize: screenWidth * 0.04),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                filled: true,
                fillColor: kPrimaryColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "doesn't have account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                      ),
                    ))
              ],
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {},
              child: Text(
                "Continue without login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
