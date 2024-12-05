import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';

import '../../constants/colors.const.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Column(
        children: [
          TextField(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("post",
                          style: TextStyle(color: Colors.white)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding * 4,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              // const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SearchProfileScreen()));
                      },
                      leading: const CircleAvatar(),
                      title: const Text(
                        "username",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text("name",
                          style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class SearchProfileScreen extends StatefulWidget {
  const SearchProfileScreen({super.key});

  @override
  State<SearchProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<SearchProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text(
            "username",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white))
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Text("0", style: TextStyle(color: Colors.white)),
                      Text("Posts", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Text("0", style: TextStyle(color: Colors.white)),
                      Text("Followers", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Text("0", style: TextStyle(color: Colors.white)),
                      Text("Following", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text("Name", style: TextStyle(color: Colors.white)),
            Text("Bio", style: TextStyle(color: Colors.white)),
            Center(
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: Text("Followed Status",
                        style: TextStyle(color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
