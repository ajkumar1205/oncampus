import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/models/user.model.dart';
import 'package:oncampus/pages/Authentication/otp_verification_page.dart';
import '../../constants/colors.const.dart';
import '../../constants/padding.const.dart';
import '../../services/auth_service.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const route = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rollNumber = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor,
            colorScheme: ColorScheme.light(primary: kPrimaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime? date) {
    return date != null
        ? DateFormat('yyyy-MM-dd').format(date)
        : 'Select Date of Birth';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double formFieldHeight = screenHeight * 0.07;
    final double fieldSpacing = screenHeight * 0.02;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.30,
                height: screenHeight * 0.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Firstname
              SizedBox(
                  height: formFieldHeight,
                  child: TextFormField(
                    controller: _firstnameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Firstname',
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

              SizedBox(height: fieldSpacing),
              // Lastname
              SizedBox(
                  height: formFieldHeight,
                  child: TextFormField(
                    controller: _lastnameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Lastname',
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

              SizedBox(height: fieldSpacing),
              // Username
              SizedBox(
                  height: formFieldHeight,
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
              SizedBox(height: fieldSpacing),

              // Email
              SizedBox(
                  height: formFieldHeight,
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email',
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
              SizedBox(height: fieldSpacing),

              // Password
              SizedBox(
                  height: formFieldHeight,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
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
              SizedBox(height: fieldSpacing),

              // Roll Number
              SizedBox(
                  height: formFieldHeight,
                  child: TextFormField(
                    controller: _rollController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Roll Number',
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
              SizedBox(height: fieldSpacing),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: formFieldHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDate(_selectedDate),
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: _selectedDate != null
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              SizedBox(height: fieldSpacing),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: formFieldHeight * 0.3,
                        horizontal: screenWidth * 0.1,
                      ),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: _register,
                  child: const Text("Register",
                      style: TextStyle(color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    final authService = AuthService();
    try {
      final val = await authService.register(
          firstname: _firstnameController.text.trim(),
          username: _usernameController.text.trim(),
          lastname: _lastnameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          dob: DateFormat('yyyy-MM-dd').format(_selectedDate!).toString(),
          roll: _rollController.text.trim());

      if (val['status'] == 'success') {
        final box = await Hive.openBox(config);

        final user = User.fromJson(val['data']['user']);
        await box.put(currentUser, user);

        GoRouter.of(context).go(OTPVerificationPage.route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(val['message']),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }
}
