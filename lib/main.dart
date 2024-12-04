import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:oncampus/constants/hive.const.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/router.dart';
import 'constants/size.const.dart';
import 'firebase_options.dart';
import 'models/user.model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init(
    (await getApplicationDocumentsDirectory()).path,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox(config);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp.router(
      title: 'ONCAMPUS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
