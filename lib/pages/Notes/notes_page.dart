import 'package:flutter/material.dart';
import 'package:oncampus/pages/Notes/all_notes_page.dart';
import 'package:oncampus/pages/Notes/personal_notes_page.dart';
import '../../constants/colors.const.dart';

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
    return Container(
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
                      text: "Your Notes",
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
                      text: "All Notes",
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
        ),
      ),
    );
  }
}