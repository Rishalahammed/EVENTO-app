import 'package:evento/product_dt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestore.dart';

class AddproductPage extends StatefulWidget {
  const AddproductPage({super.key});

  @override
  State<AddproductPage> createState() => _AddproductPageState();
}

class _AddproductPageState extends State<AddproductPage> {
  List<String> _categorys = [
    "Inauguration Events",
    "Birthday Parties",
    "pre wedding events",
    "Inauguration Events",
    "Birthday Parties ",
    "pre wedding events"
  ];

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _prizeController = TextEditingController();

  FireStore obj = FireStore();

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
            onPressed: () {
              obj.addProduct(
                  FirebaseAuth.instance.currentUser!.uid,
                  // _descriptionController.text.trim(),
                  // _categoryController.text.trim(),
                  // _prizeController.text.trim(),
                  UserModel(
                      userName: _descriptionController.text,
                      userEmail: _categoryController.text,
                      mobNo: _prizeController.text,
                      whastappNo: _prizeController.text));
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
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Colors.teal.shade800,
                        )),
                  ),
                  //
                  //
                  //
                  //*************** Column with image and text button ***************
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                            height: 160,
                            child: Image.asset("assets/images/addimg.png")),
                      ),
                      //
                      //
                      //
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Add Images",
                          style: TextStyle(
                            color: Colors.blue,
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
                    border: Border.all(color: Colors.black26),
                    color: Colors.teal.shade50,
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
                      thickness: 3,
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
                  hintText: "  Flower Designs | Bussiness Events |",
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
}
