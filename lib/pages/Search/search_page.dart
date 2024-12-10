import 'package:flutter/material.dart';
import 'package:oncampus/models/profile.model.dart';
import 'package:oncampus/services/profile_service.dart';
import 'dart:async';
import '../../utils/extensions.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.w,
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

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   Timer? _debounceTimer;
//   bool _showResults = false;
//   List<Profile> _searchResults = [];

//   final profileService = ProfileService();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _debounceTimer?.cancel();
//     super.dispose();
//   }

//   void _onSearchChanged(String query) {
//     // Cancel the previous timer
//     _debounceTimer?.cancel();

//     // Set a new timer
//     _debounceTimer = Timer(const Duration(seconds: 2), () {
//       // Check if query is not empty before showing results
//       if (query.isNotEmpty) {
//         setState(() {
//           _showResults = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: EdgeInsets.only(
//             left: 5.w,
//             right: 5.w,
//             top: 10.w,
//           ),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   setState(() {
//                     _showResults = false; // Hide results while typing
//                   });
//                   _onSearchChanged(value);
//                 },
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: kPrimaryColor),
//                       borderRadius: BorderRadius.circular(20.0)),
//                 ),
//               ),
//               // const SizedBox(height: 20),
//               Expanded(
//                 child: _showResults
//                     ? FutureBuilder(
//                         future: profileService
//                             .searchProfiles(_searchController.text.trim()),
//                         builder: (context, snap) {
//                           if (snap.connectionState == ConnectionState.waiting) {
//                             return const Center(
//                                 child: CircularProgressIndicator(
//                                     color: Colors.white));
//                           }

//                           if (snap.hasError) {
//                             return const Center(
//                                 child: Text("Error",
//                                     style: TextStyle(color: Colors.white)));
//                           }

//                           if (snap.data == null || snap.data!.isEmpty) {
//                             return const Center(
//                                 child: Text("No results found",
//                                     style: TextStyle(color: Colors.white)));
//                           }

//                           return ListView.builder(
//                             itemCount: snap.data!.length,
//                             itemBuilder: (context, index) {
//                               final profile = snap.data![index];
//                               return ListTile(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const SearchProfileScreen()));
//                                 },
//                                 leading: const CircleAvatar(),
//                                 title: Text(
//                                   profile.username,
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 subtitle: Text(
//                                     "${profile.firstName} ${profile.lastName}",
//                                     style: TextStyle(color: Colors.white)),
//                               );
//                             },
//                           );
//                         })
//                     : const Center(
//                         child: Text(
//                           "Start typing to see results...",
//                           style: TextStyle(color: Colors.grey, fontSize: 16),
//                         ),
//                       ),
//               )
//             ],
//           ),
//         ));
//   }
// }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;
  List<Profile> _searchResults = [];
  bool _isLoading = false;
  bool _showResults = false;

  final profileService = ProfileService();

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Cancel the previous debounce timer
    _debounceTimer?.cancel();

    // Set a new timer to debounce search requests
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isNotEmpty) {
        setState(() {
          _isLoading = true; // Show a loading indicator
        });

        try {
          // Fetch search results
          final results = await profileService.searchProfiles(query.trim());
          setState(() {
            _searchResults = results;
            _showResults = true;
            _isLoading = false;
          });
        } catch (e) {
          // Handle errors
          setState(() {
            _searchResults = [];
            _showResults = true;
            _isLoading = false;
          });
        }
      } else {
        // Clear search results if the query is empty
        setState(() {
          _searchResults = [];
          _showResults = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
          top: 10.w,
        ),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => _onSearchChanged(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : _showResults
                      ? (_searchResults.isNotEmpty
                          ? ListView.builder(
                              itemCount: _searchResults.length,
                              itemBuilder: (context, index) {
                                final profile = _searchResults[index];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SearchProfileScreen(
                                                profile: profile),
                                      ),
                                    );
                                  },
                                  leading: const CircleAvatar(
                                      child:
                                          Icon(Icons.person) // Example property
                                      ),
                                  title: Text(
                                    profile.username,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "${profile.firstName} ${profile.lastName}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      : const Center(
                          child: Text(
                            "Start typing to see results...",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchProfileScreen extends StatelessWidget {
  const SearchProfileScreen({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: Text(
            profile.username,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white))
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 4.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(profile.posts.toString(),
                          style: TextStyle(color: Colors.white)),
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
            Text("${profile.firstName} ${profile.lastName}",
                style: TextStyle(color: Colors.white)),
            Text(profile.bio ?? "", style: TextStyle(color: Colors.white)),
            Center(
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
                    child:
                        Text("Follow", style: TextStyle(color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
