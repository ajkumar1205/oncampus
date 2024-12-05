import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:oncampus/pages/Followers/mainFollowers.dart';
import 'package:oncampus/pages/Profile/edit_page.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../models/user.model.dart';
import '../../constants/colors.const.dart';
import '../../constants/padding.const.dart';
import '../../constants/hive.const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  final user = Hive.box(config).get(currentUser) as User?;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CachedNetworkImage(
                      imageUrl: user!.profileUrl != null
                          ? user!.profileUrl.toString()
                          : "",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("${user!.firstname} ${user!.lastname}",
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  Text(user!.bio ?? "",
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  Text("@${user!.userName}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Posts", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MainFollowersPage(index: 0)))
                },
                child: const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Followers", style: TextStyle(color: Colors.white)), 
                  ],
                ),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainFollowersPage(index: 1)))
                },
                child: const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Following", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditPage()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: const Text(
                    "Share Profile",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
