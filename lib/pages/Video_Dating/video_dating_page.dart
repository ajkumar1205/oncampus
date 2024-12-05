import 'package:flutter/material.dart';

class VideoDatingPage extends StatefulWidget {
  const VideoDatingPage({super.key});

  @override
  State<VideoDatingPage> createState() => _VideoDatingPageState();
}

class _VideoDatingPageState extends State<VideoDatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Dating"),
      ),
      body: const Center(
        child: Text("Video Dating Page"),
      ),
    );
  }
}
