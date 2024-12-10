import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oncampus/components/textCard.dart';
import 'package:oncampus/models/user.model.dart';
import 'package:oncampus/services/post_service.dart';
import 'package:oncampus/utils/extensions.dart';
import 'package:oncampus/constants/hive.const.dart';
import '../../components/card.dart';

class FriendsHomePage extends StatefulWidget {
  const FriendsHomePage({super.key});

  @override
  State<FriendsHomePage> createState() => _FriendsHomePageState();
}

class _FriendsHomePageState extends State<FriendsHomePage> {
  @override
  Widget build(BuildContext context) {
    final postService = PostService();
    final user = Hive.box(config).get(currentUser) as User?;
    if (user != null) {
      log(user.userName);
      log(user.isActive.toString());
      log(user.email);
      log(user.firstname);
      log(user.lastname);
      log(user.bio ?? "<NO BIO>");
    }

    return FutureBuilder(
        future: postService.getFriendsPosts(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          if (snap.hasError) {
            return const Center(
                child: Text("Error Loading Posts",
                    style: TextStyle(color: Colors.white)));
          }

          if (snap.data == null || snap.data!.isEmpty) {
            return const Center(
                child: Text("No posts available",
                    style: TextStyle(color: Colors.white)));
          }

          return Padding(
            padding: EdgeInsets.all(3.w),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                final post = snap.data![index];
                return textCard(context, post);
              },
            ),
          );
        });
  }
}
