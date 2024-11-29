import 'package:flutter/material.dart';
import 'package:oncampus/pages/ProfileSection/edit_page.dart';
import '../../constants/colors.const.dart';
import '../../constants/padding.const.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;
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
        imageFile = File(croppedImage.path);
      });
    }
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Upload Profile Picture"),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
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
              ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Username",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            width: 100,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        showPhotoOptions();
                      },
                      padding: const EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            (imageFile != null) ? FileImage(imageFile!) : null,
                        child: (imageFile == null)
                            ? const Icon(
                                Icons.person,
                                size: 30,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("Name", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text("Pronouns",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text("Bio", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text("@username",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Posts", style: TextStyle(color: Colors.white)),
                  ],
                ),
                const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Followers", style: TextStyle(color: Colors.white)),
                  ],
                ),
                const Column(
                  children: [
                    Text("0", style: TextStyle(color: Colors.white)),
                    Text("Following", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditPage()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: const Text(
                      "Share Profile",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
