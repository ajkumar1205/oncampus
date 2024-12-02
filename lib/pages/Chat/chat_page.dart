import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oncampus/constants/padding.const.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          titleSpacing: 0, // Adjusted titleSpacing for better alignment
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: Row(
            children: [
              // Profile Avatar
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10), // Add spacing between avatar and text
              // Name and Active Status
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 3),
                  Text("Active Status",
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ],
              ),
              const Spacer(), // To push content to the left side and make space for forward arrow
              // Forward arrow icon
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.video,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Expanded(child: Container()),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                        const Flexible(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter message...",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.send, color: Colors.white))
                      ],
                    )),
              ],
            )));
  }
}
