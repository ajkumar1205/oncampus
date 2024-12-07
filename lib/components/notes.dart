import 'package:flutter/material.dart';
import 'package:oncampus/components/likeButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.const.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final List<String> pdfUrls = [
    'https://www.pdf995.com/samples/pdf.pdf',
    'https://www.pdf995.com/samples/pdf.pdf',
    'https://www.pdf995.com/samples/pdf.pdf',
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        margin: EdgeInsets.all(screenWidth * 0.04),
        width: screenWidth * 0.9,
        height: screenHeight * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: Colors.white,
            width: screenWidth * 0.005,
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
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Text(
                    "Username",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ),
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
                          return const NotesOption();
                        },
                      );
                    },
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: screenWidth * 0.07,
                    )),
              ],
            ),
            SizedBox(height: screenWidth * 0.05),
            CarouselSlider(
              items: pdfUrls.map((url) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    child: PDFView(
                      filePath: url,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: false,
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
              children: pdfUrls.asMap().entries.map((entry) {
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

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const LikeButton(),
                      IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.comments,
                          color: Colors.white,
                          size: screenWidth * 0.05,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.autorenew,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    " Description goes here...",
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
        ));
  }
}

class NotesOption extends StatefulWidget {
  const NotesOption({super.key});

  @override
  State<NotesOption> createState() => _NotesOptionState();
}

class _NotesOptionState extends State<NotesOption> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenWidth * 0.8,
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: ListView(
          children: [
            ListTile(
              title: Text("Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: screenWidth * 0.05,
                  )),
            ),
            ListTile(
              title: Text("Not Interested",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.eyeSlash,
                      color: Colors.white, size: screenWidth * 0.05)),
            ),
            ListTile(
              title: const Text("Copy Link",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link, color: Colors.white)),
            ),
            ListTile(
              title: Text("Mute",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.bellSlash,
                      color: Colors.white, size: screenWidth * 0.05)),
            ),
            ListTile(
              title: Text("Block",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.045,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.userSlash,
                      color: Colors.red, size: screenWidth * 0.05)),
            ),
            ListTile(
              title: Text("Report",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.045,
                  )),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.exclamation,
                      color: Colors.red, size: screenWidth * 0.05)),
            ),
          ],
        ));
  }
}
