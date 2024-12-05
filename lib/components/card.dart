import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';
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
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      width: 330,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
          const Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
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
          const SizedBox(height: 10),

          // CarouselSlider
          CarouselSlider(
            items: imageUrls.map((url) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 210,
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
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const CommentBox();
                          },
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.comment,
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
