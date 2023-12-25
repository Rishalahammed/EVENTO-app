import 'package:flutter/material.dart';

import '../../product_dt.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //
  //
  //
  //**********Example og lists we used in the program*********
  static List<productdt> main_products = [
    productdt("titleex", "detailex", 1000, "img1.png"),
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
    productdt("gdteftye", "jhvedvgg", 400, "assets/facebook.png")
  ];

  //
  //
  //
  //
  //*********The list we are accessing************
  // List<productdt> display_list = List.from(main_products);

  //
  //
  //
  //
  //************ Function for filtering the list*******
  void updateList(String value) {
    setState(() {
      main_products
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
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: main_products.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No Result Found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: main_products.length,
                                  itemBuilder: (context, index) => ListTile(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    title: Text(
                                      main_products[index].product_title!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        main_products[index].product_detail!),
                                    trailing: Text(
                                      "₹ ${main_products[index].product_prize}",
                                      style: const TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Image.asset(
                                        main_products[index].img_url!),
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
