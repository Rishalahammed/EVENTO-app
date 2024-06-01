import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/model/productmodel.dart';
import 'package:evento/pages/vdbottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../firestore.dart';

class AddproductPage extends StatefulWidget {
  const AddproductPage({super.key});

  @override
  State<AddproductPage> createState() => _AddproductPageState();
}

class _AddproductPageState extends State<AddproductPage> {
  /////////////////////--- Category list ---//////////////////
  final List<String> _categorys = [
    "Event Management",
    "Event Decorators",
    "Food Caterers",
    "Food Makers",
    "Product Sellers",
    "Product Rentals"
  ];

  ////////////////////---- Controllers of fields ----///////////////////
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _prizeController = TextEditingController();

  FireStore firestore = FireStore();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  File? imageFile;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //
      //
      //************************* App bar *************************
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.teal.shade300,
        //
        //
        //
        //********************** Icon button for back *********************
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        //
        //
        //
        //******************* Icon button for Submit **********************
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 25),
            onPressed: () async {
              await uploadImage(imageFile)
                  .then(
                    (value) => firestore.addProduct(
                      FirebaseAuth.instance.currentUser!.uid,
                      ProductModel(
                        vendorId: FirebaseAuth.instance.currentUser!.uid,
                        vendorType:
                            Provider.of<FireStore>(context, listen: false)
                                .currentvendorModel!
                                .type,
                        product_description: _descriptionController.text,
                        product_category: _categoryController.text,
                        product_prize: int.parse(_prizeController.text),
                        img_url: value,
                      ),
                    ),
                  )
                  .then((value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBarvd(),
                      ),
                      (route) => false));
            },
            icon: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
        //
        //
        //
        //******************* Text add product ******************
        title: const Text(
          "ADD PRODUCTS",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      //
      //
      //
      //
      //********************* Body part ************************
      //
      //
      //******* Whole Container --------------------------------------
      body: Container(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
        ),
        //
        //
        //
        //*********** Whole Column ----------------------------
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //
              //
              const SizedBox(
                height: 40,
              ),
              //
              //
              //
              //**************** First Container of add image *******************
              Stack(
                children: [
                  // Container(
                  //   height: 220,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       color: Colors.teal.shade50,
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(
                  //         width: 2,
                  //         color: Colors.teal.shade800,
                  //       )),
                  // ),
                  //
                  //
                  //
                  //*************** Column with image and text button ***************
                  Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topCenter,
                      //   child: SizedBox(
                      //       height: 160,
                      //       child: Image.asset("assets/images/addimg.png")),
                      // ),
                      // //
                      // //
                      // //
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     "Add Images",
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      imageFile == null
                          ? InkWell(
                              onTap: () {
                                showImagePicker(context);
                              },
                              child: Container(
                                height: 260,
                                // width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/addimg.png'),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.teal.shade800,
                                    )),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.teal.shade800,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    imageFile!,
                                    height: 260,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  //
                  //
                  //
                ],
              ),
              //
              //
              //
              const SizedBox(
                height: 50,
              ),
              //
              //
              //
              //**************** Second Container of description *******************
              Container(
                padding: const EdgeInsets.all(20),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 2,
                    ),
                    // color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(10)),
                //
                //
                //
                //**************** Column with text and text field ****************
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        " Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    //
                    //
                    const SizedBox(
                      height: 8,
                    ),
                    //
                    //
                    const Divider(
                      thickness: 2,
                    ),
                    //
                    //
                    TextField(
                      maxLines: 2,
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        hintText: " Write About Your Product",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              //
              const SizedBox(
                height: 50,
              ),
              //
              //
              //
              //************** Text and text field of category **************
              const Text(" Category",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: "  Event Management | Food Caterer |",
                ),
              ),
              //
              //
              //
              const SizedBox(
                height: 10,
              ),
              //
              //
              //
              //******************** Category hints *********************
              SizedBox(
                height: 35,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categorys.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _categoryController.text = _categorys[index];
                        });
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: Colors.black26,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            _categorys[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
              //************** Text and text field of Prize **************
              const Text("Prize"),
              TextField(
                controller: _prizeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    size: 20,
                  ),
                  hintText: "0",
                ),
              ),
              //
              //
              //
              const SizedBox(
                height: 40,
              ),
              //
              //
              //

              //
              //

              //
              //
              //
              const SizedBox(
                height: 40,
              ),
              //
              //
              //
            ],
          ),
          //
          //
          //
        ),
      ),
      //
      //
      //
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////FUNCTIONS/////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  //Function of picking image from gallery
  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then(
      (value) {
        if (value != null) {
          imageCache.clear();
          setState(
            () {
              imageFile = File(value.path);
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
            },
          );
        }
      },
    );
  }

  //
  //
  //
  //Function of storing image on firebase storage
  Future<String?> uploadImage(pickedFile) async {
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
        firebase_storage.Reference reference =
            firebase_storage.FirebaseStorage.instance.ref().child(
                '${FirebaseAuth.instance.currentUser!.uid}/Product_image/$fileName');
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
