import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select & Crop Image'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),

            ///////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////
            imageFile == null
                ? Image.asset(
                    'assets/images/people.png',
                    height: 300.0,
                    width: 300.0,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      imageFile!,
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                    )),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                showImagePicker(context);

                // Map<Permission, PermissionStatus> statuses = await [
                //   Permission.storage,
                //   Permission.camera,
                // ].request();
                // if (statuses[Permission.storage]!.isGranted &&
                //     statuses[Permission.camera]!.isGranted) {
                //   showImagePicker(context);
                // } else {
                //   print('no permission provided');
                // }
              },
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
  //
  //
  //
  /////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: const Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        imageCache.clear();
        setState(() {
          imageFile = File(value.path);
        });
        // _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        imageCache.clear();
        setState(() {
          imageFile = File(value.path);
        });
        // _cropImage(File(value.path));
      }
    });
  }

  // _cropImage(File imgFile) async {
  //   final croppedFile = await ImageCropper().cropImage(
  //       sourcePath: imgFile.path,
  //       aspectRatioPresets: Platform.isAndroid
  //           ? [
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio16x9
  //             ]
  //           : [
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio5x3,
  //               CropAspectRatioPreset.ratio5x4,
  //               CropAspectRatioPreset.ratio7x5,
  //               CropAspectRatioPreset.ratio16x9
  //             ],
  //       uiSettings: [
  //         AndroidUiSettings(
  //             toolbarTitle: "Image Cropper",
  //             toolbarColor: Colors.deepOrange,
  //             toolbarWidgetColor: Colors.white,
  //             initAspectRatio: CropAspectRatioPreset.original,
  //             lockAspectRatio: false),
  //         IOSUiSettings(
  //           title: "Image Cropper",
  //         )
  //       ]);
  //   if (croppedFile != null) {
  //     imageCache.clear();
  //     setState(() {
  //       imageFile = File(croppedFile.path);
  //     });
  //     // reload();
  //   }
  // }
  Future<void> uploadImage(pickedFile) async {
    try {
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();

        firebase_storage.Reference reference =
            firebase_storage.FirebaseStorage.instance.ref().child(
                '${FirebaseAuth.instance.currentUser!.uid}/Product_image/$fileName');
        await reference.putFile(imageFile);

        // Get the download URL of the uploaded image.
        String downloadURL = await reference.getDownloadURL();
        print('Image uploaded: $downloadURL');
      } else {
        // User canceled the image picking.
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}

// Future<String> storeImagetoStorge(String ref, File file) async {
//   SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
//   UploadTask uploadTask =
//       firebaseStorage.ref().child(ref).putFile(file, metadata);
//   TaskSnapshot snapshot = await uploadTask;
//   String downloadURL = await snapshot.ref.getDownloadURL();
//   log(downloadURL);
//   // notifyListeners();
//   return downloadURL;
// }

//////////////////////////////////-----Source----////////////////////////////////////////////
// Future<void> uploadImage() async {
//   try {
//     final pickedFile =
//     await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//
//       firebase_storage.Reference reference =
//       firebase_storage.FirebaseStorage.instance.ref().child(
//           '${FirebaseAuth.instance.currentUser!.uid}/Product_image/$fileName');
//       await reference.putFile(imageFile);
//
//       // Get the download URL of the uploaded image.
//       String downloadURL = await reference.getDownloadURL();
//       print('Image uploaded: $downloadURL');
//     } else {
//       // User canceled the image picking.
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
//   }
// }
//////////////////////////////////////////////////////////////////////////////
