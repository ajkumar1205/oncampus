// import 'package:flutter/material.dart';
// import 'package:oncampus/constants/padding.const.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';

// class CreatepostPage extends StatefulWidget {
//   const CreatepostPage({super.key});

//   @override
//   State<CreatepostPage> createState() => _CreatepostPageState();
// }

// class _CreatepostPageState extends State<CreatepostPage> {
//   String? _selectedOption = 'Public';
//   List<File> imageFiles = [];

//   void selectImage(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       cropImage(pickedFile);
//     }
//   }

//   void cropImage(XFile file) async {
//     CroppedFile? croppedImage = await ImageCropper().cropImage(
//       sourcePath: file.path,
//       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//       compressQuality: 20,
//     );
//     if (croppedImage != null) {
//       setState(() {
//         imageFiles
//             .add(File(croppedImage.path)); // Add the cropped image to the list
//       });
//     }
//   }

//   void showPhotoOptions() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//               title: const Text("Upload Post"),
//               content: Column(mainAxisSize: MainAxisSize.min, children: [
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.gallery);
//                   },
//                   leading: const Icon(Icons.photo_album),
//                   title: const Text("Select from gallery"),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.camera);
//                   },
//                   leading: const Icon(Icons.camera_alt),
//                   title: const Text("Take a photo"),
//                 ),
//               ]));
//         });
//   }

//   void removeImage(int index) {
//     setState(() {
//       imageFiles.removeAt(index); // Remove image from list
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.close,
//             color: Colors.red,
//           ),
//         ),
//         title: const Text(
//           "New Post",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Next",
//                 style: TextStyle(color: Colors.blue),
//               ))
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(kDefaultPadding * 2),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Set Visibility",
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: RadioListTile<String>(
//                     title: const Text(
//                       'Public',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     value: 'Public',
//                     groupValue: _selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedOption = value;
//                       });
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: RadioListTile<String>(
//                     title: const Text(
//                       'Private',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     value: 'Private',
//                     groupValue: _selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedOption = value;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 showPhotoOptions();
//               },
//               child: SizedBox(
//                 height: 300,
//                 width: 300,
//                 child: (imageFiles.isEmpty)
//                     ? Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.white),
//                         ),
//                         child: const Center(
//                             child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 40,
//                         )),
//                       )
//                     : ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: imageFiles.length,
//                         itemBuilder: (context, index) {
//                           return post(imageFiles[index], index);
//                         },
//                       ),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               width: 300,
//               child: TextField(
//                 maxLines: 3,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Add Caption...',
//                   contentPadding: const EdgeInsets.all(kDefaultPadding),
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget post(File? imageFile, int index) {
//     return Container(
//       width: 300,
//       height: 300,
//       margin: const EdgeInsets.only(right: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.white),
//         image: imageFile != null
//             ? DecorationImage(
//                 image: FileImage(imageFile),
//                 fit: BoxFit.cover, // Adjust how the image fits the box
//               )
//             : null,
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 3,
//             right: 10,
//             child: Container(
//               width: 30, // Width of the circular button
//               height: 30, // Height of the circular button
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(
//                     0.6), // Background color (semi-transparent black)
//                 shape: BoxShape.circle, // Circular shape
//               ),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.close,
//                   color: Colors.white,
//                   size: 15,
//                 ),
//                 onPressed: () {
//                   removeImage(index); // Remove image from the list when clicked
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:oncampus/constants/padding.const.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CreatepostPage extends StatefulWidget {
  const CreatepostPage({super.key});

  @override
  State<CreatepostPage> createState() => _CreatepostPageState();
}

class _CreatepostPageState extends State<CreatepostPage> {
  String? _selectedOption = 'Public';
  List<File> imageFiles = [];
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 20,
    );
    if (croppedImage != null) {
      setState(() {
        imageFiles.add(File(croppedImage.path));
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Upload Post"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.gallery);
                },
                leading: const Icon(Icons.photo_album),
                title: const Text("Select from gallery"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a photo"),
              ),
            ],
          ),
        );
      },
    );
  }

  void removeImage(int index) {
    setState(() {
      imageFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
        title: const Text(
          "New Post",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Set Visibility",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'Public',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'Public',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text(
                        'Private',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'Private',
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: imageFiles.length + 1,
                      itemBuilder: (context, index, realIndex) {
                        if (index == imageFiles.length) {
                          return GestureDetector(
                            onTap: () {
                              showPhotoOptions();
                            },
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Show the uploaded images
                          return post(imageFiles[index], index);
                        }
                      },
                      options: CarouselOptions(
                        height: 250,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageFiles.asMap().entries.map((entry) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == entry.key
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Add Caption...',
                    contentPadding: const EdgeInsets.all(kDefaultPadding),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget post(File? imageFile, int index) {
    return Container(
      width: 300,
      height: 300,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        image: imageFile != null
            ? DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  removeImage(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
