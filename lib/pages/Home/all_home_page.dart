import 'package:flutter/material.dart';
import 'package:oncampus/components/textCard.dart';
import 'package:oncampus/services/post_service.dart';
import 'package:oncampus/utils/extensions.dart';
import '../../components/card.dart';

class AllHomePage extends StatelessWidget {
  const AllHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postService = PostService();

    return FutureBuilder(
        future: postService.getAllPosts(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return const Center(
                child: Text("Error", style: TextStyle(color: Colors.white)));
          }

          if (snap.data == null || snap.data!.isEmpty) {
            return const Center(
                child: Text("No posts available",
                    style: TextStyle(color: Colors.white)));
          }

          return Padding(
            padding: EdgeInsets.all(3.w),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                final post = snap.data![index];
                return textCard(context, post);
              },
            ),
          );
        });
  }
}
