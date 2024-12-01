import 'package:flutter/material.dart';
import 'package:oncampus/constants/colors.const.dart';
import 'package:oncampus/constants/padding.const.dart';

Widget listItemBuilder(BuildContext context, int index) {
  return ListTile(
    title: const Text("username", style: TextStyle(color: Colors.white)),
    subtitle: const Text("name", style: TextStyle(color: Colors.white)),
    leading: CircleAvatar(),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: const Text(
              "Message",
              style: TextStyle(color: Colors.white),
            )),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: kBottomSheetColor,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25.0)), //
              ),
              context: context,
              builder: (BuildContext context) {
                return index == 0
                    ? const RemoveFollowerSection()
                    : const FollowingSection();
              },
            );
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class RemoveFollowerSection extends StatelessWidget {
  const RemoveFollowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Remove Follower?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "We won't tell username they removed from your followers",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Remove",
              style: TextStyle(
                color: Colors.red,
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
    return Container(
      height: 300,
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 15),
              Text("username", style: TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Manage notifications",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text(
              "See shared activity",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Mute",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Unfollow",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
