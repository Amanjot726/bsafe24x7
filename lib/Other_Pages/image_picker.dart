import 'dart:io';
import 'package:bsafe24x7/Auth/login.dart';
import 'package:bsafe24x7/Util/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  String? folderName, imageName;
  ImagePickerPage({Key? key, this.folderName, this.imageName}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

  String imagePath = "NA";
  final ImagePicker _picker = ImagePicker();
  String text = 'Capture';

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);
    try {
      await FirebaseStorage.instance
          .ref(widget.folderName!+'/'+widget.imageName.toString()+'.png')
          .putFile(file);
      await FirebaseStorage.instance
          .ref(widget.folderName!+'/'+widget.imageName.toString()+'.png')
          .getDownloadURL()
          .then((value) => imagePath = value.toString());
      text = 'Selected';
      print(imagePath);
      print("UPLOAD SUCCESS");
      Show_Snackbar(message: 'UPLOAD SUCCESS', context: context);

      setState(() {});
      imagePath=='NA'? CircularProgressIndicator()
          : Navigator.pop(context, {'imageURL': imagePath, 'imageName': widget.imageName=='' ? 'image' : widget.imageName.toString()+'.png'});

    } on FirebaseException catch (e) {
      print("UPLOAD FAILED");
      Show_Snackbar(message: 'UPLOAD FAILED', context: context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              // colors: [Colors.redAccent.shade100, Colors.orangeAccent, ],
              colors: [Colors.redAccent.shade100, Colors.black87],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text('Pick Image', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click on "Capture" button to Capture Image', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
            OutlinedButton(
              onPressed: () async {
                final XFile? image = await _picker.pickImage(
                    source: ImageSource.camera);
                uploadFile(image!.path);
              },
              child: Text(text, style: TextStyle(color: Colors.white),),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}