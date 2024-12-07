import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/models/user.model.dart';
import 'package:oncampus/services/auth_service.dart';
import 'package:oncampus/utils/extensions.dart';

import '../../constants/colors.const.dart';
import '../Home/main_home_page.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  static const route = "/otp";

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  // List to hold OTP input controllers
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  // List to hold focus nodes for OTP input
  List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());

  // Timer variables
  late Timer _timer;
  int _remainingSeconds = 25;
  bool _canResendOTP = false;
  final auth = AuthService();
  final user = Hive.box(config).get(currentUser) as User;

  @override
  void initState() {
    super.initState();
    // Start the countdown timer

    log(user.email);

    auth.sendOtp(user.email).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: value
              ? Text("Otp sending initiated")
              : Text("ERROR! Resend OTP")));
    });

    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        // Timer finished
        _timer.cancel();
        setState(() {
          _canResendOTP = true;
        });
      }
    });
  }

  void resendOTP() async {
    // Reset timer and restart

    final r = await auth.sendOtp(user.email);

    if (r) {
      setState(() {
        _remainingSeconds = 30;
        _canResendOTP = false;
      });
      startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Resent')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to send otp')),
      );
    }
  }

  void verifyOTP() async {
    // Combine OTP from all controllers
    String otp = otpControllers.map((controller) => controller.text).join();

    if (otp.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Verifying OTP: $otp'), duration: Durations.short4),
      );

      final r = await auth.verifyOtp(user.email, otp);

      if (r) {
        GoRouter.of(context).go(MainHomePage.route,
            extra: {'index': 0} as Map<String, dynamic>);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter complete OTP'),
            duration: Durations.short4),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Enter Verification Code',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: screenHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We have sent a verification code to your email',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),

            // OTP Input Blocks
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Flexible(
                  flex: 1,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kBottomSheetColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onChanged: (value) {
                        // Move focus to next input when a digit is entered
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context)
                              .requestFocus(otpFocusNodes[index + 1]);
                        }
                        // Move focus back if deleted
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context)
                              .requestFocus(otpFocusNodes[index - 1]);
                        }
                      },
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // Resend OTP and Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Resend OTP Button
                TextButton(
                  onPressed: _canResendOTP ? resendOTP : null,
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                      color: _canResendOTP ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
                if (_remainingSeconds != 0)
                  Row(
                    children: [
                      const Text(
                        'Resend OTP in ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '00:$_remainingSeconds',
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 20),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: Size(screenWidth * 0.8, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: verifyOTP,
              child: const Text(
                "Verify",
                style: TextStyle(color: Colors.black),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
