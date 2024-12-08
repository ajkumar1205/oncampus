import 'package:flutter/material.dart';
import 'package:oncampus/components/textCard.dart';
import '../../components/card.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({super.key});

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return textCard(context);
        },
      ),
    );
  }
}
