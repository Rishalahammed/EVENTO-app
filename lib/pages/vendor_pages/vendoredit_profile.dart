import 'dart:io';

import 'package:evento/pages/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../user_pages/userprofile_page.dart';
// import 'package:project_0/pages/user_pages/userprofile_page.dart';

class VendoreditProfile extends StatefulWidget {
  const VendoreditProfile({super.key});

  @override
  State<VendoreditProfile> createState() => _VendoreditProfileState();
}

class _VendoreditProfileState extends State<VendoreditProfile> {
  var editusername = TextEditingController();
  var editemail = TextEditingController();
  var editcity = TextEditingController();
  var editstate = TextEditingController();
  var editmobile = TextEditingController();
  var editwhatsapp = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;
  // Uint8List? _image;
  //
  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  //
  //
  //
  //
  //********************* Body *************************

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FireStore>(context, listen: false).currentvendorModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
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
                // _image != null
                //     ? Container(
                //         height: 110,
                //         width: 110,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           image: DecorationImage(
                //             fit: BoxFit.cover,
                //             image: MemoryImage(_image!),
                //           ),
                //         ),
                //       )
                //     :
                //
                //
                //
                //*************** Image holding container *****************
                InkWell(
                  onTap: () {
                    showImagePicker(context);
                  },
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: imageFile == null
                          ? const DecorationImage(
                              fit: BoxFit.cover,
                              // ignore: unnecessary_null_comparison
                              image: AssetImage("assets/images/people.png"))
                          : DecorationImage(
                              fit: BoxFit.cover,
                              // ignore: unnecessary_null_comparison
                              image: FileImage(imageFile!)),
                    ),
                  ),
                ),
                //
                //
                //
                //*************** Icon added for profile picture update ****************
                Positioned(
                  top: 80,
                  left: 105,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_outlined, size: 20),
                  ),
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
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        FireStore().editVendordetail("userName", value);
                      },
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
                    //******************** Text field of email *****************
                    TextFormField(
                      controller: editemail,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: provider!.email,
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
                    //******************** Row contain city & state field *****************
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        //
                        //
                        //******************** Text field of state *****************
                        Flexible(
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              FireStore().editVendordetail("city", value);
                            },
                            controller: editcity,
                            decoration: const InputDecoration(
                              labelText: "City",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        //
                        const SizedBox(
                          width: 15,
                        ),
                        //
                        //
                        //
                        //******************** Text field of city *****************
                        Flexible(
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              FireStore().editVendordetail("state", value);
                            },
                            controller: editstate,
                            decoration: const InputDecoration(
                              labelText: "State",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.blue),
                              ),
                            ),
                          ),
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
                      height: 15,
                    ),
                    //
                    //
                    //
                    //******************** Text field for mobile *****************
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FireStore().editVendordetail("Mobile Number", value);
                      },
                      controller: editmobile,
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
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
                    //******************** Text field for Whatsapp ******************
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FireStore().editVendordetail("Whatsapp Number", value);
                      },
                      controller: editwhatsapp,
                      decoration: const InputDecoration(
                        labelText: 'Whatsapp',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
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
                    //
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    //
                    //
                    //

                    //
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
      bottomNavigationBar: Padding(
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
            onPressed: () {
              if (formkey.currentState!.validate()) {
                Provider.of<FireStore>(context, listen: false)
                    .fetchCurrentUserDetailData(
                  "All-Vendor",
                  FirebaseAuth.instance.currentUser!.uid,
                );
                Navigator.of(context).pop(true);
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }

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

  File? imageFile;
//
//
//
//Function of picking image from gallery
  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then(
      (value) {
        if (value != null) {
          imageCache.clear();
          setState(
            () {
              imageFile = File(value.path);
              uploadImage(imageFile, context).then((value) {
                Provider.of<FireStore>(context, listen: false)
                    .editVendorProfileImage(value);
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
//Function of picking from camera
  _imgFromCamera() async {
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50).then(
      (value) {
        if (value != null) {
          imageCache.clear();
          setState(
            () {
              imageFile = File(value.path);
              uploadImage(imageFile, context).then((value) {
                Provider.of<FireStore>(context, listen: false)
                    .editVendorProfileImage(value);
              });
            },
          );
        }
      },
    );
  }
}

Future<String?> uploadImage(pickedFile, context) async {
  //
  //
  // final vendor = db.collection("management");
  // final product = vendor
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection("products")
  //     .doc();
  // final productId = product.id;
  //
  //
  String? downloadURL;
  try {
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
      Reference reference = firebase_storage.FirebaseStorage.instance.ref().child(
          '${FirebaseAuth.instance.currentUser!.uid}/vendorprofile/$fileName');
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
