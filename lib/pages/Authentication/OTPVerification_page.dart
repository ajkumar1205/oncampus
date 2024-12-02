import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oncampus/constants/padding.const.dart';
import '../../constants/colors.const.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    // Start the countdown timer
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

  void resendOTP() {
    // Reset timer and restart
    setState(() {
      _remainingSeconds = 25;
      _canResendOTP = false;
    });
    startTimer();

    // TODO: Implement actual OTP resend logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Resent')),
    );
  }

  void verifyOTP() {
    // Combine OTP from all controllers
    String otp = otpControllers.map((controller) => controller.text).join();

    if (otp.length == 6) {
      // TODO: Implement OTP verification logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifying OTP: $otp')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter complete OTP')),
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.black,
        title: const Text(
          'Enter Verification Code',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding * 2),
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
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: otpControllers[index],
                    focusNode: otpFocusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
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
                );
              }),
            ),

            SizedBox(height: 20),

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
                Row(
                  children: [
                    const Text(
                      'Resend OTP in ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '00:$_remainingSeconds',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: verifyOTP,
                  child: const Text("Verify",
                      style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
