import 'package:flutter/material.dart';

import '../firestore.dart';

class AddproductPage extends StatefulWidget {
  const AddproductPage({super.key});

  @override
  State<AddproductPage> createState() => _AddproductPageState();
}

class _AddproductPageState extends State<AddproductPage> {
  final List<CategoryList> _categorys = [
    CategoryList("Inauguration Events"),
    CategoryList("Birthday Parties"),
    CategoryList("pre wedding events"),
    CategoryList("Inauguration Events"),
    CategoryList("Birthday Parties "),
    CategoryList("pre wedding events"),
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
                _descriptionController.text.trim(),
                _categoryController.text.trim(),
                _prizeController.text.trim(),
              );
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
        title: Text(
          "ADD PRODUCTS",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 1),
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
                    height: 200,
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
                            child: Image.asset("assets/addimg.png")),
                      ),
                      //
                      //
                      //
                      TextButton(
                        onPressed: () {},
                        child: const Text("Add Images"),
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
                padding: EdgeInsets.all(20),
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
                    Align(
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
                    SizedBox(
                      height: 8,
                    ),
                    //
                    //
                    Divider(
                      thickness: 3,
                    ),
                    //
                    //
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
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
              Text(" Category",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  hintText: "  Flower Designs | Bussiness Events |",
                ),
              ),
              //
              //
              //
              SizedBox(
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
                          _categorys[index]._categoryhint!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
              SizedBox(
                height: 50,
              ),
              //
              //
              //
              //************** Text and text field of Prize **************
              Text("Prize"),
              TextField(
                controller: _prizeController,
                decoration: InputDecoration(
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
              SizedBox(
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
              SizedBox(
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

class CategoryList {
  String? _categoryhint;

  CategoryList(this._categoryhint);
}
