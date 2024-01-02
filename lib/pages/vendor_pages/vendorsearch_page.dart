import 'package:evento/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:flutter/material.dart';

import '../../product_dt.dart';

class VendorsearchPage extends StatefulWidget {
  const VendorsearchPage({super.key});

  @override
  State<VendorsearchPage> createState() => _VendorsearchPageState();
}

class _VendorsearchPageState extends State<VendorsearchPage> {
  //
  //
  //
  //**********Example og lists we used in the program*********
  static List<Productdt> main_products = [
    Productdt("titleex", "detailex", 1000, "assets/images/img1.png"),
    Productdt("aitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("aitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("uitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("kitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("eitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("eitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("hitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("witleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("pitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("oitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("oitleex", "detailex", 1000, "assets/images/facebook.png"),
    Productdt("gdteftye", "jhvedvgg", 400, "assets/images/facebook.png"),
  ];

  //
  //
  //
  //
  //*********The list we are accessing************
  List<Productdt> display_list = List.from(main_products);

  //
  //
  //
  //
  //************ Function for filtering the list*******
  void updateList(String value) {
    setState(() {
      display_list = main_products
          .where((element) => element.product_title!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // resizeToAvoidBottomInset: false,
      //
      //
      //
      //************** Body part ****************
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              //
              //
              //
              //*************** Sized box contains image *****************
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                child: Image.asset("assets/images/search_img.jpg"),
              ),
              //
              //
              //
              //**************** Whole container with contain column with search bar and elements ****************
              Container(
                height: 630,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                //
                //
                //
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 23, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //
                      //
                      //
                      //
                      TextField(
                        onChanged: (value) => (updateList(value)),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black26,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.search),
                            ),
                            prefixIconColor: Colors.white),
                        cursorColor: Colors.black,
                      ),
                      //
                      //
                      //
                      const SizedBox(
                        height: 20,
                      ),
                      //
                      //
                      //
                      Expanded(
                        //
                        //
                        //************ If search has got 0 result *************
                        child: display_list.isEmpty
                            ? const Center(
                                child: Text(
                                  "No Result Found",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                            //
                            //
                            //
                            //****************** List view builder to show the results *******************
                            : ListView.builder(
                                itemCount: display_list.length,
                                itemBuilder: (context, index) => ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  //Leading image of the tile
                                  leading:
                                      Image.asset(display_list[index].img_url!),
                                  // Title of the tile
                                  title: Text(
                                    display_list[index].product_title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //Subtitle of the tile
                                  subtitle: Text(
                                      display_list[index].product_description!),
                                  // Trailing of the tile
                                  trailing: Text(
                                    "₹ ${display_list[index].product_price}",
                                    style: const TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VendordetailsPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        //
                        //
                        //
                      ),
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
      ),
      //
      //
      //
    );
  }
}
