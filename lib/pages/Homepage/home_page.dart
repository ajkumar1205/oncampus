import 'package:flutter/material.dart';
import 'Homepage/friends_home_page.dart';
import 'Homepage/all_home_page.dart';
import '../constants/colors.const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const FriendsHomePage(),
    const AllHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
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
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TopBar(
                          text: "Friends",
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
                          text: "All",
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
              Expanded(
                child: pages.elementAt(_selectedIndex),
              ),
            ],
          )),
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
