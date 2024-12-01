import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';

import 'followers_page.dart';
import 'following_page.dart';

import '../../constants/colors.const.dart';

class MainFollowersPage extends StatefulWidget {
  final int index;
  const MainFollowersPage({required this.index, super.key});

  @override
  State<MainFollowersPage> createState() => _MainFollowersPageState();
}

class _MainFollowersPageState extends State<MainFollowersPage> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  List<Widget> pages = [
    const FollowersPage(),
    const FollowingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("username", style: TextStyle(color: Colors.white)),
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TopBar(
                        text: "0 follower",
                        selected: _selectedIndex == 0,
                        ontap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TopBar(
                        text: "0 following",
                        selected: _selectedIndex == 1,
                        ontap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Row(
            //   children: [
            //     Icon(Icons.search),
            //     TextField(
            //       style: TextStyle(color: Colors.white),
            //       decoration: InputDecoration(
            //         hintText: "Search",
            //         hintStyle: TextStyle(color: Colors.grey),
            //       ),
            //     )
            //   ],
            // ),
            Expanded(
              child: pages.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final String text;
  final bool selected;
  final Function() ontap;

  const TopBar(
      {super.key,
      required this.text,
      required this.ontap,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
          backgroundColor: selected ? kPrimaryColor : Colors.black),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
