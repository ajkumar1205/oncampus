import 'package:flutter/material.dart';
import '../../components/list.dart';
import '../../constants/padding.const.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return listItemBuilder(context, 1);
        },
      ),
    );
    ;
  }
}
