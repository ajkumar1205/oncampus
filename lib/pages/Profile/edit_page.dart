import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oncampus/constants/hive.const.dart';
import "package:oncampus/constants/padding.const.dart";
import 'package:oncampus/models/user.model.dart';
import '../../utils/extensions.dart';
import '../../constants/colors.const.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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

  final user = Hive.box(config).get(currentUser) as User?;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(text: user?.firstname);
    lastNameController = TextEditingController(text: user?.lastname);
    bioController = TextEditingController(text: user!.bio ?? "");
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
          title: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
          actions: [
            Container(
              width: 27.w,
              height: 9.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    showPhotoOptions();
                  },
                  padding: const EdgeInsets.all(0),
                  child: CircleAvatar(
                    radius: 15.w,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        (imageFile != null) ? FileImage(imageFile!) : null,
                    child: (imageFile == null)
                        ? Icon(
                            Icons.person,
                            size: 15.w,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Edit Picture",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                // const SizedBox(height: 10),
                // TextField(
                //   style: const TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     hintText: 'Username',
                //     hintStyle: const TextStyle(color: Colors.grey),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0)),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // TextField(
                //   style: const TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     hintText: 'Add Your Pronouns',
                //     hintStyle: const TextStyle(color: Colors.grey),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0)),
                //   ),
                // ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Bio',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BioPage()),
                    );
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 70.w,
                  height: 6.h,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      child: const Text(
                        "Save changes",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

class BioPage extends StatefulWidget {
  const BioPage({super.key});

  @override
  State<BioPage> createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Bio",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.close,
            color: Colors.white,
            size: 25,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 2),
            child: TextField(
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Bio',
                contentPadding: const EdgeInsets.all(kDefaultPadding),
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            )));
  }
}
