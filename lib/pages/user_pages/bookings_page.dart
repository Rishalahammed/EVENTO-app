import 'package:evento/pages/user_pages/productdetails_page.dart';
import 'package:flutter/material.dart';

import '../../product_list.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  static List<Productlist> main_products = [
    Productlist("titleex", "detailex", 1000, "assets/images/img1.png"),
    Productlist("titleex", "detailex", 1000, "assets/images/img2.jpg"),
    Productlist("tihdvseex", "detailex", 1000, "assets/images/img3.jpg"),
    Productlist("cbAKCBtleex", "detailex", 1000, "assets/images/img4.jpg"),
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
          //
          //
          //
          //***************** Icon button for back ****************
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
          //************** Title on the appbar ***************
          title: const Text(
            "Bookings & Orders",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white,
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
          itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 8),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(
                      color: Colors.teal,
                      width: 3,
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
                      //
                      //
                      //
                      //**************** Container with image ***************
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          width: 100,
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
                      //************** Sized box with texts and prices inside ***************
                      SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //
                              //
                              //
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
                      const Spacer(),
                      //
                      //
                      //
                      SizedBox(
                        height: 120,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close_rounded,
                            ),
                          ),
                        ),
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
                //
                //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
