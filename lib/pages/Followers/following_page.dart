import 'package:flutter/material.dart';
import '../../components/list.dart';
import '../../utils/extensions.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.w),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return listItemBuilder(context, 1);
        },
      ),
    );
  }
}
