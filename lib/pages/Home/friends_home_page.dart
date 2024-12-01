import 'package:flutter/material.dart';
import '../../components/card.dart';

class FriendsHomePage extends StatefulWidget {
  const FriendsHomePage({super.key});

  @override
  State<FriendsHomePage> createState() => _FriendsHomePageState();
}

class _FriendsHomePageState extends State<FriendsHomePage> {
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
  }
}
