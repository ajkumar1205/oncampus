import 'package:flutter/material.dart';
import 'package:oncampus/pages/Chat/chat_list_page.dart';
import 'package:oncampus/pages/Chat/chat_page.dart';
import 'package:oncampus/pages/Posts/createPost_page.dart';

import '../Search/search_page.dart';
import '../Notes/notes_page.dart';
import '../Video_Dating/video_dating_page.dart';
import '../Home/home_page.dart';
import '../../constants/colors.const.dart';
import '../Profile/profile_page.dart';

class MainHomePage extends StatefulWidget {
  final int index;
  const MainHomePage({super.key, this.index = 0});
  static const route = "/main";

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedScreenIndex = 0;
  List<Widget> screen = [
    const HomePage(),
    const SearchPage(),
    const VideoDatingPage(),
    const NotesPage(),
    const ProfilePage(),
  ];

  List<String> titles = [
    "",
    "",
    "",
    "",
    "Username",
  ];

  @override
  void initState() {
    _selectedScreenIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          titles[_selectedScreenIndex],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatepostPage()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatListPage()));
              },
              icon: const Icon(Icons.chat_bubble_outline_rounded,
                  color: Colors.white)),
          Container(
            width: 100,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: screen.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                    icon: Icons.home,
                    selected: _selectedScreenIndex == 0,
                    ontap: () {
                      setState(() {
                        _selectedScreenIndex = 0;
                      });
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.search,
                    selected: _selectedScreenIndex == 1,
                    ontap: () {
                      setState(() {
                        _selectedScreenIndex = 1;
                      });
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.video_call,
                    selected: _selectedScreenIndex == 2,
                    ontap: () {
                      setState(() {
                        _selectedScreenIndex = 2;
                      });
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.notes,
                    selected: _selectedScreenIndex == 3,
                    ontap: () {
                      setState(() {
                        _selectedScreenIndex = 3;
                      });
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.person,
                    selected: _selectedScreenIndex == 4,
                    ontap: () {
                      setState(() {
                        _selectedScreenIndex = 4;
                      });
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() ontap;

  const IconBottomBar(
      {super.key,
      required this.icon,
      required this.ontap,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: ontap,
          icon: Icon(
            icon,
            color: selected ? kPrimaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
