import 'package:evento/pages/user_pages/productdetails_page.dart';
import 'package:flutter/material.dart';

import '../../product_list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List<Productlist> main_products = [
    Productlist("titleex", "detailex", 1000, "assets/images/img1.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("tihdvseex", "detailex", 1000, "assets/images/google.png"),
    Productlist("cbAKCBtleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("auhurtitleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("o4tuatitleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("oacbtitleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("hcvhtitleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/google.png"),
  ];
  //
  //
  //
  //
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
                letterSpacing: 5,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      //
      //
      //
      //
      //********************** Body part *************************
      body: Center(
        child: ListView.builder(
          itemCount: main_products.length,
          itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    border: Border.all(
                      color: Colors.black12,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(0),
                    ),
                  ),
                ),
                //
                //
                //
                //************** Row contains inside the container **************
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        //
                        //
                        //
                        //**************** Container with image ***************
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(main_products[index].img_url!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //
                        //
                        //
                      ),
                      SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                main_products[index].product_title!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              //
                              //
                              //
                              const SizedBox(
                                height: 4,
                              ),
                              //
                              //
                              //
                              Text(
                                main_products[index].product_detail!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              ),
                              //
                              //
                              //
                              const SizedBox(
                                height: 8,
                              ),
                              //
                              //
                              //
                              Text(
                                "₹ ${main_products[index].product_prize}",
                                style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              //
                              //
                              //
                            ],
                          ),
                        ),
                      ),
                      //
                      //
                      //
                    ],
                  ),
                ),
                //
                //
                //
                Positioned(
                  top: -7,
                  right: 8,
                  child: SizedBox(
                    height: 25,
                    width: 95,
                    child: ElevatedButton(
                      clipBehavior: Clip.none,
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.teal.shade900,
                        ),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Remove -",
                        maxLines: 1,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //
            //
            //
          ),
          //
          //
          //
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
