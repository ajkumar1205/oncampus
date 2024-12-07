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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("Video Dating", style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text("Video Dating Page", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
