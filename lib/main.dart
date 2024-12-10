import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/pages/Profile/profile_page.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/router.dart';
import 'constants/size.const.dart';
import 'models/user.model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  try {
    // Open the box
    await Hive.openBox(config);
  } catch (e) {
    print('Error opening Hive box: $e');
    // Optionally delete and recreate the box if there's a persistent issue
    await Hive.deleteBoxFromDisk(config);
    await Hive.openBox(config);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp.router(
      title: 'onCampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
