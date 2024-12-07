import 'package:flutter/material.dart';

import '../components/likeButton.dart';

Widget commentItem(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.only(bottom: screenWidth * 0.04),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // Border color
                  width: screenWidth * 0.005, // Border width
                ),
              ),
              child: CircleAvatar(
                  radius: screenWidth * 0.06,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: screenWidth * 0.08,
                  )),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("username",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.04)),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    "The quick brown fox jumps over the lazy dog. Underneath the pale moonlight, shadows danced across the forest floor, whispering secrets only the wind could understand. ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const LikeButton(),
                Text("456",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.04))
              ],
            )
          ],
        ),
      ],
    ),
  );
}
