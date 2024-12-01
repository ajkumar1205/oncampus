import 'package:flutter/material.dart';
import 'package:oncampus/components/likeButton.dart';
import '../constants/padding.const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.const.dart';

Widget itemBuilder(BuildContext context, int index) {
  return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.all(kDefaultPadding * 1.25),
      width: 330,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
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
              const SizedBox(width: 15),
              const Expanded(
                child: Text(
                  "Username",
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
                        return const NotesOption();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 25,
                  )),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 10,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter your note here',
              contentPadding: const EdgeInsets.all(kDefaultPadding),
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Row(
            children: [
              const LikeButton(),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.comments,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.autorenew,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ));
}

class NotesOption extends StatefulWidget {
  const NotesOption({super.key});

  @override
  State<NotesOption> createState() => _NotesOptionState();
}

class _NotesOptionState extends State<NotesOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Save", style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, color: Colors.white)),
            ),
            ListTile(
              title: const Text("Not Interested",
                  style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.eyeSlash,
                      color: Colors.white, size: 20)),
            ),
            ListTile(
              title: const Text("Copy Link",
                  style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link, color: Colors.white)),
            ),
            ListTile(
              title: const Text("Mute", style: TextStyle(color: Colors.white)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.bellSlash,
                      color: Colors.white, size: 20)),
            ),
            ListTile(
              title: const Text("Block", style: TextStyle(color: Colors.red)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.userSlash,
                      color: Colors.red, size: 20)),
            ),
            ListTile(
              title: const Text("Report", style: TextStyle(color: Colors.red)),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.exclamation,
                      color: Colors.red, size: 20)),
            ),
          ],
        ));
  }
}
