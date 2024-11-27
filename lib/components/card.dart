import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';

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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LikeButton(),
                    Text(
                      "user_name",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Text(
                  "Caption",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? Colors.red : Colors.white,
      ),
      tooltip: _isFavorited ? "Unlike" : "Like",
      onPressed: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
    );
  }
}
