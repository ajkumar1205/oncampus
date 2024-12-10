import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oncampus/constants/colors.const.dart';
import 'package:oncampus/pages/Authentication/register_page.dart';
import 'package:oncampus/pages/Home/main_home_page.dart';
import 'package:oncampus/services/auth_service.dart';
import 'package:oncampus/utils/extensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
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
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Expanded(child: Container()),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
                height: 7.h,
                child: TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
            SizedBox(height: 2.h),
            SizedBox(
                height: 7.h,
                child: TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go(RegisterPage.route);
                  },
                  child: Text(
                    "Don't have account? Register!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      final auth = AuthService();

                      final data = await auth.login(
                          user: _usernameController.text,
                          password: _passwordController.text);

                      if (data == null) {
                        GoRouter.of(context)
                            .go(MainHomePage.route, extra: {"index": 0});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(data),
                            backgroundColor: kPrimaryColor,
                            duration: Durations.medium2,
                          ),
                        );
                      }
                    },
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
            // TextButton(
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("Feature Yet to be implemented"),
            //         backgroundColor: kPrimaryColor,
            //         duration: Durations.medium2,
            //       ),
            //     );
            //   },
            //   child: Text(
            //     "Continue without Login",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: screenWidth * 0.035,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
