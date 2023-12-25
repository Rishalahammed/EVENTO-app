import 'package:flutter/material.dart';

// import 'package:project_0/product_list.dart';

import '../../product_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List<Productlist> main_products = [
    Productlist("titleex", "detailex", 1000, "assets/img1.png"),
    Productlist("titleex", "detailex", 1000, "assets/google.png"),
    Productlist("tihdvseex", "detailex", 1000, "assets/google.png"),
    Productlist("cbAKCBtleex", "detailex", 1000, "assets/google.png"),
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
  //*********The list we are accessing************
  List<Productlist> display_list = List.from(main_products);

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
          title: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "LIST",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
            ),
          ),
          centerTitle: true),
      //
      //
      //
      //
      //********************** Body part *************************
      body: Center(
        child: ListView.builder(
          itemCount: display_list.length,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          border: Border.all(color: Colors.black12, width: 2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(0))),

                      height: 120,
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
                                      AssetImage(display_list[index].img_url!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(display_list[index].product_title!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(display_list[index].product_detail!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text("₹ ${display_list[index].product_prize}",
                                    style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Positioned(
                      top: -7,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(5)),
                        height: 25,
                        width: 75,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Remove -",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //
                //
                //
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        height: 60,
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total:", style: TextStyle(color: Colors.white, fontSize: 15)),
            Text("₹ 20,000",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
