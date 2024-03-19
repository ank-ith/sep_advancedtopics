import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDSe8hQb-00Cdfsesoyqecmal1zGeEA2T8",
          appId: "1:960760904715:android:9c6ee0b75f972ca7721b0e",
          messagingSenderId: "",
          projectId: "fir-new-6ea87",
          storageBucket: "fir-new-6ea87.appspot.com"));
  runApp(MaterialApp(
    home: Fire_img_storage(),
  ));
}

class Fire_img_storage extends StatefulWidget {
  const Fire_img_storage({super.key});

  @override
  State<Fire_img_storage> createState() => _Fire_img_storageState();
}

class _Fire_img_storageState extends State<Fire_img_storage> {
  FirebaseStorage storage =FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image store'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('camera'),
                    icon: Icon(Icons.camera),
                    label: Text('Camera')),
                ElevatedButton.icon(
                    onPressed: () => upload('gallery'),
                    icon: Icon(Icons.photo),
                    label: Text('gallery')),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> upload(String imageFrom) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: imageFrom == 'camera' ? ImageSource.camera : ImageSource
              .gallery);
      final String filename=path.basename(pickedImage!.path);
      File imageFile=File(pickedImage.path);
      try {
      await storage.ref().putFile(imageFile);
      }on FirebaseException catch(error){
        print(error);
      }
    }
    catch(error){
      print(error);
    }
  }
}
