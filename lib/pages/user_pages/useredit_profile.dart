import 'dart:io';

import 'package:evento/pages/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var editusername = TextEditingController();
  var editemail = TextEditingController();
  var editcity = TextEditingController();
  var editstate = TextEditingController();
  var editmobile = TextEditingController();
  var editwhatsapp = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;
  File? imageFile;
  //
  //
  //
  //***********************************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 30,
            shadows: [Shadow(color: Colors.white, blurRadius: 18)],
          ),
        ),
      ),
      //
      //
      //
      //********************** Body *******************************
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            //
            //
            //******************* Image added to the top ********************

            Image.asset(
              "assets/images/profile1.png",
              fit: BoxFit.cover,
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 15,
            ),
            //
            //
            //
            //******************** Text Edit profile ***********************
            const Text(
              "EDIT PROFILE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 35,
            ),
            //
            //
            //
            //************** Profile image and stacked icon button here ******************
            Stack(
              clipBehavior: Clip.none,
              children: [
                //
                //
                //
                //******************* Default image that can be changed *********************
                imageFile == null
                    ? InkWell(
                        onTap: () {
                          showImagePicker(context);
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/people.png'),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    //
                    //
                    //
                    //******************** Changed image properties ********************
                    : InkWell(
                        onTap: () {
                          showImagePicker(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            imageFile!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                //
                //
                //
                //*************** Icon added for profile picture update ****************
                const Positioned(
                  bottom: 5,
                  right: -10,
                  child: Icon(Icons.add_a_photo_outlined),
                ),
                //
                //
                //
                //
              ],
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 50,
            ),
            //
            //
            //
            //
            //********************* Form starts from here ********************
            Form(
              key: formkey, //Key for the form
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //
                    //
                    //
                    //******************** Text field of username ************
                    TextFormField(
                      controller: editusername,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: Provider.of<FireStore>(context, listen: false)
                            .currentUserDetailModel!
                            .userName,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Provider.of<FireStore>(context, listen: false)
                            .editUserName(value);
                      },
                      onSaved: (String? value) {
                        print(value);
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      // validator: (String? value) {
                      //   return (value != null && value.contains('@'))
                      //       ? 'Do not use the @ char.'
                      //       : null;
                      // },
                    ),
                    //
                    //
                    //
                    //

                    const SizedBox(
                      height: 50,
                    ),
                    //
                    //
                    //
                    //******************** Text field of email *****************
                    TextFormField(
                      controller: editemail,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText:
                            Provider.of<FireStore>(context, listen: false)
                                .currentUserDetailModel!
                                .userEmail,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    //
                    //
                    //
                    //
                    const SizedBox(
                      height: 15,
                    ),
                    //
                    //
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<FireStore>(builder: (context, fire, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  await fire.fetchCurrentUserDetailData(
                      "user", FirebaseAuth.instance.currentUser!.uid);
                  fire.listen();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ),
        );
      }),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////// FUNCTIONS //////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
////////////////////--- Function for image picking ---////////////////////
//
  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    //
    //
    //Bottom sheet for choosing the way of picking
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
                //
                //
                //
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
                        ),
                      ],
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                //
                //
                //
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
                //
                //
                //
              ],
            ),
          ),
        );
      },
    );
  }

//
//
//
////////////////-- Function of picking image from gallery --///////////////////
  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then(
      (value) {
        if (value != null) {
          imageCache.clear();
          setState(
            () {
              imageFile = File(value.path);
              showTimedPopup(context);
              uploadImage(imageFile, context).then((value) {
                Provider.of<FireStore>(context, listen: false)
                    .edituserProfileImage(value);
              });
            },
          );
        }
      },
    );
  }

//
//
//
////////////////-- Function of picking from camera --///////////////////
  _imgFromCamera() async {
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50).then(
      (value) {
        if (value != null) {
          imageCache.clear();
          setState(
            () {
              imageFile = File(value.path);
              showTimedPopup(context);
              uploadImage(imageFile, context).then((value) {
                Provider.of<FireStore>(context, listen: false)
                    .edituserProfileImage(value);
              });
            },
          );
        }
      },
    );
  }

//
//
//
////////////////-- Function of uploading image to DB and updating --///////////////////

  Future<String?> uploadImage(pickedFile, context) async {
    String? downloadURL;
    try {
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
        Reference reference = firebase_storage.FirebaseStorage.instance
            .ref()
            .child(
                '${FirebaseAuth.instance.currentUser!.uid}/userProfile/$fileName');
        await reference.putFile(imageFile, metadata);

        // Get the download URL of the uploaded image.
        downloadURL = await reference.getDownloadURL();
        print('Image uploaded: $downloadURL');

        return downloadURL;
      } else {
        // User canceled the image picking.
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
    return downloadURL;
  }
}

//
//
//
////////-- Function of alert box which last for 5 seconds for image upload --/////////
void showTimedPopup(BuildContext context) {
  // Show dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // Custom dialog content
      return AlertDialog(
        title: Text(
          'Image Uploading..',
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.teal.shade50,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1, color: Colors.white),
        ),
        // content: Text('This pop-up will disappear in 8 seconds.'),
      );
    },
  );
  // Close dialog after 5 seconds
  Future.delayed(Duration(seconds: 5), () {
    Navigator.of(context).pop(); // Close the dialog
  });
}
