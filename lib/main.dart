import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oncampus/pages/home_page.dart';
import 'package:oncampus/pages/login_page.dart';
import 'package:oncampus/pages/signup_page.dart';

import 'pages/signin_page.dart';
import 'constants/size.const.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
