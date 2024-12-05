import 'package:flutter/material.dart';
import '../../components/card.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({super.key});

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const HomeCard();
        },
      ),
    );
    ;
  }
}
