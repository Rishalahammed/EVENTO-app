import 'package:evento/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:flutter/material.dart';

// import 'package:project_0/pages/vendor_pages/vendorproductdetails_page.dart';

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
  static List<productdt> main_products = [
    productdt("titleex", "detailex", 1000, "assets/facebook.png"),
    productdt("aitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("aitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("hitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("uitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("hitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("kitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("eitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("eitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("hitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("witleex", "detailex", 1000, "assets/facebook.png"),
    productdt("pitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("oitleex", "detailex", 1000, "assets/facebook.png"),
    productdt("oitleex", "detailex", 1000, "assets/facebook.png"),
  ];

  //
  //
  //
  //
  //*********The list we are accessing************
  List<productdt> display_list = List.from(main_products);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Navigation(),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 175,
              width: double.infinity,
              child: Image.asset("assets/search_img.jpg"),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 23, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          onChanged: (value) => (updateList(value)),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.search),
                              ),
                              prefixIconColor: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: display_list.length == 0
                              ? Center(
                                  child: Text(
                                    "No Result Found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: display_list.length,
                                  itemBuilder: (context, index) => ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VendordetailsPage(),
                                        ),
                                      );
                                    },
                                    contentPadding: EdgeInsets.all(8.0),
                                    title: Text(
                                      display_list[index].product_title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        display_list[index].product_detail!),
                                    trailing: Text(
                                      "₹ ${display_list[index].product_prize}",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Image.asset(
                                        display_list[index].img_url!),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
