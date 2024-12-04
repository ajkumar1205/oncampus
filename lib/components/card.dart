import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';
import 'likeButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.const.dart';
import '../components/commentItem.dart';

Widget itemBuilder(BuildContext context, int index) {
  return Container(
    padding: const EdgeInsets.all(kDefaultPadding),
    margin: const EdgeInsets.all(kDefaultPadding * 1.25),
    width: 330,
    height: 450,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -25,
          left: -25,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Border color
                width: 2, // Border width
              ),
            ),
            child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        const Positioned(
          left: 50,
          top: 5,
          child: Text(
            "NAME",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 71,
          child: Container(
            height: 71,
            width: 290,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white, width: 2),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const LikeButton(),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: kBottomSheetColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0)), //
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const CommentBox();
                          },
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.comments,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                    )
                    // Text(
                    //   "user_name",
                    //   style: TextStyle(color: Colors.white),
                    // )
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Caption",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class CommentBox extends StatefulWidget {
  const CommentBox({super.key});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return commentItem(context);
              },
            ),
          ),
          Row(
            children: [
              CircleAvatar(),
              const SizedBox(width: 10),
              const Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a comment for username..",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: kPrimaryColor, // Background color
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_upward, color: Colors.white)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
