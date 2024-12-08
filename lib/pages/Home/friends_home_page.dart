import 'package:flutter/material.dart';
import 'package:oncampus/components/textCard.dart';
import '../../components/card.dart';

class FriendsHomePage extends StatefulWidget {
  const FriendsHomePage({super.key});

  @override
  State<FriendsHomePage> createState() => _FriendsHomePageState();
}

class _FriendsHomePageState extends State<FriendsHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return textCard(context);
        },
      ),
    );
  }
}
