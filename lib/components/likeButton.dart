import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? Colors.red : Colors.white,
        size: screenWidth * 0.07,
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
