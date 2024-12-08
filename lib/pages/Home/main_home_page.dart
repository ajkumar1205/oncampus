import 'package:flutter/material.dart';
import 'package:oncampus/pages/Chat/chat_list_page.dart';
import 'package:oncampus/pages/Notes/create_notes_page.dart';

import 'package:oncampus/pages/Posts/createTextPost_page.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          titles[_selectedScreenIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTextPostPage()));
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
            width: screenWidth * 0.2,
            height: screenWidth * 0.1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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
                      // setState(() {
                      //   _selectedScreenIndex = 1;
                      // });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.video_call,
                    selected: _selectedScreenIndex == 2,
                    ontap: () {
                      // setState(() {
                      //   _selectedScreenIndex = 2;
                      // });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoDatingPage()));
                    },
                  ),
                  IconBottomBar(
                    icon: Icons.menu_book,
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
      floatingActionButton: _selectedScreenIndex == 3
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNotesPage()));
              },
              backgroundColor: kPrimaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            )
          : null,
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
