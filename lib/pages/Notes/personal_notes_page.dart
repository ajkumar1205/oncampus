import 'package:flutter/material.dart';
import '../../components/notes.dart';
import 'package:oncampus/utils/extensions.dart';

class PersonalNotesPage extends StatefulWidget {
  const PersonalNotesPage({super.key});

  @override
  State<PersonalNotesPage> createState() => _PersonalNotesPageState();
}

class _PersonalNotesPageState extends State<PersonalNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const NoteCard();
        },
      ),
    );
  }
}
