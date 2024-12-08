import 'package:flutter/material.dart';
import '../constants/colors.const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/likeButton.dart';
import '../components/commentItem.dart';

Widget textCard(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return Container(
      padding: EdgeInsets.all(screenWidth * 0.06),
      margin: EdgeInsets.all(screenWidth * 0.04),
      width: screenWidth * 0.9,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(
          color: Colors.white,
          width: screenWidth * 0.002,
        ),
        color: Colors.black54,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // Border color
                  width: screenWidth * 0.002, // Border width
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
            left: 30,
            top: 1,
            child: Text(
              "NAME",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 40,
            child: SizedBox(
              width: screenWidth * 0.8,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  softWrap: true,
                  "Once upon a time, in a small village surrounded by towering mountains, a curious fox named Milo decided to explore the world beyond his home. The villagers often spoke of a mysterious forest where the trees whispered secrets to those who listened closely.Once upon a time, in a small village surrounded by towering mountains, a curious fox named Milo decided to explore the world beyond his home. The villagers often spoke of a mysterious forest where the trees whispered secrets to those who listened closely.Once upon a time, in a small village surrounded by towering mountains, a curious fox named Milo decided to explore the world beyond his home. The villagers often spoke of a mysterious forest where the trees whispered secrets to those who listened closely.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.5,
            child: Row(
              children: [
                const LikeButton(),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(screenWidth * 0.05),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const CommentBox();
                      },
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.comments,
                    color: Colors.white,
                    size: screenWidth * 0.05,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 90),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(screenWidth * 0.05),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: ListTile(
                              title: Text("Report",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: screenWidth * 0.045,
                                  )),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesomeIcons.exclamation,
                                      color: Colors.red,
                                      size: screenWidth * 0.05)),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert_outlined,
                        color: Colors.white))
              ],
            ),
          )
        ],
      ));
}

class CommentBox extends StatefulWidget {
  const CommentBox({super.key});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
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
              CircleAvatar(radius: screenWidth * 0.05),
              SizedBox(width: screenWidth * 0.02),
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
                height: screenWidth * 0.1,
                width: screenWidth * 0.1,
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
