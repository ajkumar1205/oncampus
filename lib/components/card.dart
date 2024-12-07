import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'likeButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.const.dart';
import '../components/commentItem.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  final List<String> imageUrls = [
    'https://via.placeholder.com/600x300.png?text=Image+1',
    'https://via.placeholder.com/600x300.png?text=Image+2',
    'https://via.placeholder.com/600x300.png?text=Image+3',
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.015),
      margin: EdgeInsets.all(screenWidth * 0.03),
      width: screenWidth * 0.85,
      height: screenHeight * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        color: Colors.black54,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (Avatar and Name)
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              const Text(
                "NAME",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // CarouselSlider
          CarouselSlider(
            items: imageUrls.map((url) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: screenHeight * 0.3,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageUrls.asMap().entries.map((entry) {
              return Container(
                width: screenWidth * 0.02,
                height: screenWidth * 0.02,
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.01,
                    vertical: screenHeight * 0.01),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                ),
              );
            }).toList(),
          ),

          // Actions and Caption
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        FontAwesomeIcons.comment,
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
                  ],
                ),
                const Text(
                  "caption goes here...",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
