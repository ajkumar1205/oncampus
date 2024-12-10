import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oncampus/services/post_service.dart';
import '../../utils/extensions.dart';

import 'dart:developer';

class CreateTextPostPage extends StatefulWidget {
  const CreateTextPostPage({super.key});

  @override
  State<CreateTextPostPage> createState() => _CreateTextPostPageState();
}

class _CreateTextPostPageState extends State<CreateTextPostPage> {
  String? _selectedOption = 'Public';

  final postService = PostService();

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
        title: const Text(
          "New Post",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              log("Next Button Clicked");
              postService
                  .createPost(textController.text, _selectedOption == 'Public')
                  .then((val) {
                if (val) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Post created successfully"),
                    ),
                  );
                  GoRouter.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Failed to create post"),
                    ),
                  );
                }
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Creating post..."),
                ),
              );
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Set Visibility",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(
                      'Public',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Public',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(
                      'Private',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Private',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 80.w,
              child: TextField(
                controller: textController,
                maxLines: 10,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Add Content here...',
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
