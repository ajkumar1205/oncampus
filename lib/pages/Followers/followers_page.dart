import 'package:flutter/material.dart';
import 'package:oncampus/components/list.dart';
import 'package:oncampus/constants/padding.const.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return listItemBuilder(context, 0);
        },
      ),
    );
    ;
  }
}
