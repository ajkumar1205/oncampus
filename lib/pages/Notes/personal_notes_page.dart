import 'package:flutter/material.dart';
import '../../components/notes.dart';

class PersonalNotesPage extends StatefulWidget {
  const PersonalNotesPage({super.key});

  @override
  State<PersonalNotesPage> createState() => _PersonalNotesPageState();
}

class _PersonalNotesPageState extends State<PersonalNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return itemBuilder(context, index);
        },
      ),
    );
    ;
  }
}
