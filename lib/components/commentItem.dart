import 'package:flutter/material.dart';
import '../constants/padding.const.dart';

import '../components/likeButton.dart';

Widget commentItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: kDefaultPadding * 2),
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
                  width: 2, // Border width
                ),
              ),
              child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("username", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  Text(
                    "The quick brown fox jumps over the lazy dog. Underneath the pale moonlight, shadows danced across the forest floor, whispering secrets only the wind could understand. ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                LikeButton(),
                Text("456", style: TextStyle(color: Colors.white))
              ],
            )
          ],
        ),
      ],
    ),
  );
}
