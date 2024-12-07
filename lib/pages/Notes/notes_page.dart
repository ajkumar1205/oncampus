import 'package:flutter/material.dart';
import 'package:oncampus/pages/Notes/all_notes_page.dart';
import 'package:oncampus/pages/Notes/personal_notes_page.dart';
import '../../constants/colors.const.dart';
import '../../utils/extensions.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const PersonalNotesPage(),
    const AllNotesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = 5.w;
    final topBarHeight = 7.h;

    final buttonTextSize = 4.w;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: topBarHeight,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TopBar(
                      text: "Your Notes",
                      selected: _selectedIndex == 0,
                      ontap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      textSize: buttonTextSize,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TopBar(
                      text: "All Notes",
                      selected: _selectedIndex == 1,
                      ontap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      textSize: buttonTextSize,
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
  final double textSize;

  const TopBar(
      {super.key,
      required this.text,
      required this.ontap,
      required this.selected,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: selected ? kPrimaryColor : Colors.black,
        padding: EdgeInsets.symmetric(vertical: textSize * 0.6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: textSize,
        ),
      ),
    );
  }
}
