import 'package:flutter/material.dart';
import 'friends_home_page.dart';
import 'all_home_page.dart';
import '../../constants/colors.const.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: screenWidth * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: MediaQuery.of(context).size.width * 0.045,
        ),
      ),
    );
  }
}
