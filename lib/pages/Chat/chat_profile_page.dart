import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oncampus/constants/padding.const.dart';

class ChatProfilePage extends StatefulWidget {
  const ChatProfilePage({super.key});

  @override
  State<ChatProfilePage> createState() => _ChatProfilePageState();
}

class _ChatProfilePageState extends State<ChatProfilePage> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage:
                    (imageFile != null) ? FileImage(imageFile!) : null,
                child: (imageFile == null)
                    ? const Icon(
                        Icons.person,
                        size: 50,
                      )
                    : null,
              ),
              const SizedBox(height: 5),
              const Text("Name", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person, color: Colors.white)),
                      const Text("Profile",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.white)),
                      const Text("Search",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.bell,
                              color: Colors.white)),
                      const Text("Mute", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz,
                              color: Colors.white)),
                      const Text("Options",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const ListTile(
                  leading: Icon(Icons.adjust, color: Colors.white),
                  title: Text("Theme", style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              const ListTile(
                  leading: Icon(FontAwesomeIcons.lock, color: Colors.white),
                  title: Text("Privacy & Safety",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              const ListTile(
                  leading: Icon(FontAwesomeIcons.user, color: Colors.white),
                  title:
                      Text("Nicknames", style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              const ListTile(
                  leading:
                      Icon(FontAwesomeIcons.userGroup, color: Colors.white),
                  title: Text("Create a group chat",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Shared Media", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
