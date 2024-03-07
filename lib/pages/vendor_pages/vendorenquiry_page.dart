import 'package:flutter/material.dart';

import '../product_list.dart';
// import 'package:project_0/product_list.dart';

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({super.key});

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  static List<Productlist> main_products = [
    Productlist("titleex", "detailex", 1000, "assets/img1.png"),
    Productlist("titleex", "detailex", 1000, "assets/img2.jpg"),
    Productlist("tihdvseex", "detailex", 1000, "assets/img3.jpg"),
    Productlist("cbAKCBtleex", "detailex", 1000, "assets/img4.jpg"),
    Productlist("auhurtitleex", "detailex", 1000, "assets/google.png"),
    Productlist("o4tuatitleex", "detailex", 1000, "assets/google.png"),
    Productlist("oacbtitleex", "detailex", 1000, "assets/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
    Productlist("hcvhtitleex", "detailex", 1000, "assets/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
  ];

  //
  //
  //
  //
  //************ Function for filtering the list*******

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.teal,
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
          title: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Enquiries",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
          centerTitle: true),
      //
      //
      //
      //
      //********************* Body part ************************

      body: Center(
        child: ListView.builder(
          itemCount: main_products.length,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 0),
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(color: Colors.teal, width: 3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(0))),
                      //
                      //
                      //
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage(main_products[index].img_url!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        SizedBox(
                          width: 10,
                        ),
                        //
                        //
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(main_products[index].product_title!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 4,
                            ),
                            Text(main_products[index].product_detail!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54)),
                            SizedBox(
                              height: 8,
                            ),
                            Text("₹ ${main_products[index].product_prize}",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        //
                        //
                        //
                        Spacer(),
                        //
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.teal.shade300)),
                                  onPressed: () {},
                                  child: Text("Accept"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 80,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.red.shade300)),
                                  onPressed: () {},
                                  child: Text("Reject"),
                                ),
                              )
                            ],
                          ),
                        ),
                        //
                        //
                        //
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
