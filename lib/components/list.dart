import 'package:flutter/material.dart';
import 'package:oncampus/constants/colors.const.dart';

Widget listItemBuilder(BuildContext context, int index) {
  final screenWidth = MediaQuery.of(context).size.width;
  return ListTile(
    title: Text("username",
        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045)),
    subtitle: Text("name",
        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.035)),
    leading: Container(
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
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              side:
                  BorderSide(color: kPrimaryColor, width: screenWidth * 0.003),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    screenWidth * 0.02), // Rounded corners
              ),
            ),
            child: Text(
              "Message",
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.035),
            )),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: kBottomSheetColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(screenWidth * 0.06)), //
              ),
              context: context,
              builder: (BuildContext context) {
                return index == 0
                    ? const RemoveFollowerSection()
                    : const FollowingSection();
              },
            );
          },
          icon: Icon(Icons.more_vert,
              color: Colors.white, size: screenWidth * 0.07),
        ),
      ],
    ),
  );
}

class RemoveFollowerSection extends StatelessWidget {
  const RemoveFollowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.41,
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.06,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: screenWidth * 0.08,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Remove Follower?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: screenWidth * 0.045),
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      "We won't tell username they removed from your followers",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          TextButton(
            onPressed: () {},
            child: Text(
              "Remove",
              style: TextStyle(
                color: Colors.red,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FollowingSection extends StatelessWidget {
  const FollowingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.8,
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.06,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: screenWidth * 0.08,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Text("username",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.045))
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          TextButton(
            onPressed: () {},
            child: Text(
              "Manage notifications",
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              "See shared activity",
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              "Mute",
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              "Unfollow",
              style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.04),
            ),
          ),
        ],
      ),
    );
  }
}
