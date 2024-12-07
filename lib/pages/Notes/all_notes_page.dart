import 'package:flutter/material.dart';
import '../../components/notes.dart';
import 'package:oncampus/utils/extensions.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return itemBuilder(context, index);
        },
      ),
    );
  }
}
