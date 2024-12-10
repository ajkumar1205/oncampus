import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../../utils/extensions.dart';
import 'package:oncampus/pages/Followers/mainFollowers.dart';
import 'package:oncampus/pages/Profile/edit_page.dart';

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
                    radius: 10.w,
                    backgroundColor: Colors.white,
                    child: CachedNetworkImage(
                      imageUrl: user == null
                          ? ""
                          : user!.profileUrl == null
                              ? ""
                              : user!.profileUrl.toString(),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("${user!.firstname} ${user!.lastname}",
                      style: TextStyle(color: Colors.white, fontSize: 5.w)),
                  const SizedBox(height: 5),
                  if (user!.bio != null)
                    Text(user!.bio ?? "",
                        style: TextStyle(
                            color: Colors.white, fontSize: 5.w * 0.8)),
                  if (user!.bio != null) const SizedBox(height: 5),
                  Text("@${user!.userName}",
                      style:
                          TextStyle(color: Colors.white, fontSize: 5.w * 0.9)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Text("0",
                        style: TextStyle(color: Colors.white, fontSize: 5.w)),
                    Text("Posts",
                        style: TextStyle(
                            color: Colors.white, fontSize: 5.w * 0.8)),
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
                child: Column(
                  children: [
                    Text("0",
                        style: TextStyle(color: Colors.white, fontSize: 5.w)),
                    Text("Followers",
                        style: TextStyle(
                            color: Colors.white, fontSize: 5.w * 0.8)),
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
                child: Column(
                  children: [
                    Text("0",
                        style: TextStyle(color: Colors.white, fontSize: 5.w)),
                    Text("Following",
                        style: TextStyle(
                            color: Colors.white, fontSize: 5.w * 0.8)),
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
