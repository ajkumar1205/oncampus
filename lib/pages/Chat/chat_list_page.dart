import 'package:flutter/material.dart';
import 'package:oncampus/pages/Chat/chat_page.dart';
import '../../constants/padding.const.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("username", style: TextStyle(color: Colors.white)),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 25)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chatpage()),
                  ),
                  title:
                      const Text("Name", style: TextStyle(color: Colors.white)),
                  subtitle: const Text("status",
                      style: TextStyle(color: Colors.white)),
                  leading: Container(
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
                ),
              );
            },
          ),
        ));
  }
}
