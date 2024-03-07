import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/user_pages/productdetails_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  FireStore fireobj = FireStore();
  // ignore: constant_identifier_names
  //
  //
  //*********** Images for slider carousel image *************
  static const _scroll_images = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
    'assets/images/slider4.jpg',
  ];
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //*********** Tab bar controller ************
    TabController tabController = TabController(length: 3, vsync: this);
    //
    //
    //
    return SafeArea(
      child: Scaffold(
        //
        //
        //
        //********* The Carousel sliding image which is using constantly defined images from top ***********
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(5),
                  height: 250,
                  child: ScrollPageView(
                    controller: ScrollPageController(),
                    children: _scroll_images //defined below the code-----
                        .map((image) => _imageView(image))
                        .toList(),
                  ),
                ),
                //
                //
                //
                //
                //
                //*********** Elevated buttons added for navigating through pages ***********
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    //
                    //
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    //
                    //
                    //************* Container which hold the tab bar items *************
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.circular(5)),
                        //
                        //
                        //
                        //********************* Tab bar *********************
                        child: TabBar(
                          controller: tabController,
                          labelPadding: const EdgeInsets.all(0),
                          unselectedLabelColor: Colors.teal,
                          labelColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.teal),
                          tabs: const [
                            //
                            //
                            //
                            //*************** 3 Tabs of the tab bar ****************
                            // Tab 1 ************************
                            Tab(
                              child: SizedBox(
                                height: 60,
                                width: 160,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Management",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            //
                            //
                            //
                            // Tab 2 ************************
                            Tab(
                              child: SizedBox(
                                height: 60,
                                width: 160,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Products",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            //
                            //
                            //
                            // Tab 3 ************************
                            Tab(
                              child: SizedBox(
                                height: 60,
                                width: 160,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Caterers",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
                    ),
                    //
                    //
                    //
                    //**************** Text added popular events *****************
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 20, bottom: 15),
                      child: Text('POPULAR EVENTS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    //
                    //
                    //
                    //********* Constrained box for size determination of the whole tab bar view ********
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 200, //minimum height
                        minWidth: 200, // minimum width

                        maxHeight: 500,
                        //maximum height set to 100% of vertical height

                        maxWidth: MediaQuery.of(context).size.width,
                        //maximum width set to 100% of width
                      ),
                      //
                      //
                      //
                      //****************** Tab bar views *******************
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          //
                          //
                          //
                          //***++++**** Here we used grid view builder inside the tab
                          // bar view to show the products as grids *****************
                          //
                          //
                          //// 1- First tab bar view *******************************************************************
                          Consumer<FireStore>(
                              builder: (context, firesore, child) {
                            return FutureBuilder(
                                future: firesore
                                    .fetchProductByVendorType("Management"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return firesore
                                          .productsortedbyVendorTypeList.isEmpty
                                      ? const Center(
                                          child: Text("No Data"),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          //
                                          //
                                          //
                                          child: GridView.builder(
                                            //Physics added to scroll whole page without grid scroll
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 220,
                                              childAspectRatio: 2 / 2.3,
                                              crossAxisSpacing: 30,
                                              mainAxisSpacing: 20,
                                            ),
                                            itemCount: firesore
                                                .productsortedbyVendorTypeList
                                                .length,
                                            //
                                            //
                                            //
                                            //************* built column as the item builder and wrapped
                                            // in inkwell to give on tap function **********************
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () async {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DetailsPage(
                                                        productModel: firesore
                                                                .productsortedbyVendorTypeList[
                                                            index]),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  //
                                                  //
                                                  //************** Inside the column we added container to hold the image *************
                                                  Container(
                                                    width: double.infinity,
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              firesore
                                                                  .productsortedbyVendorTypeList[
                                                                      index]
                                                                  .img_url!)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  //
                                                  //
                                                  //
                                                  //*************** and added a column for adding texts and price of product **************
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        //
                                                        //
                                                        //
                                                        //************** Title text **************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_category,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        //************ Price text *************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_prize
                                                              .toDouble()
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                });
                          }),
                          //
                          //
                          //
                          //// 2- Second tab bar view *******************************************************************
                          Consumer<FireStore>(
                              builder: (context, firesore, child) {
                            return FutureBuilder(
                                future: firesore
                                    .fetchProductByVendorType("Product Seller"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return firesore
                                          .productsortedbyVendorTypeList.isEmpty
                                      ? const Center(
                                          child: Text("No Data"),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          //
                                          //
                                          //
                                          child: GridView.builder(
                                            //Physics added to scroll whole page without grid scroll
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 220,
                                              childAspectRatio: 2 / 2.3,
                                              crossAxisSpacing: 30,
                                              mainAxisSpacing: 20,
                                            ),
                                            itemCount: firesore
                                                .productsortedbyVendorTypeList
                                                .length,
                                            //
                                            //
                                            //
                                            //************* built column as the item builder and wrapped
                                            // in inkwell to give on tap function **********************
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DetailsPage(
                                                        productModel: firesore
                                                                .productsortedbyVendorTypeList[
                                                            index]),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  //
                                                  //
                                                  //************** Inside the column we added container to hold the image *************
                                                  Container(
                                                    width: double.infinity,
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              firesore
                                                                  .productsortedbyVendorTypeList[
                                                                      index]
                                                                  .img_url!)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  //
                                                  //
                                                  //
                                                  //*************** and added a column for adding texts and price of product **************
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        //
                                                        //
                                                        //
                                                        //************** Title text **************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_category,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        //************ Price text *************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_prize
                                                              .toDouble()
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                });
                          }),
                          //
                          //
                          //
                          //// 3- third tab bar view *******************************************************************
                          Consumer<FireStore>(
                              builder: (context, firesore, child) {
                            return FutureBuilder(
                                future: firesore
                                    .fetchProductByVendorType("Food Caterer"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return firesore
                                          .productsortedbyVendorTypeList.isEmpty
                                      ? const Center(
                                          child: Text("No Data"),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          //
                                          //
                                          //
                                          child: GridView.builder(
                                            //Physics added to scroll whole page without grid scroll
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 220,
                                              childAspectRatio: 2 / 2.3,
                                              crossAxisSpacing: 30,
                                              mainAxisSpacing: 20,
                                            ),
                                            itemCount: firesore
                                                .productsortedbyVendorTypeList
                                                .length,
                                            //
                                            //
                                            //
                                            //************* built column as the item builder and wrapped
                                            // in inkwell to give on tap function **********************
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => DetailsPage(
                                                        productModel: firesore
                                                                .productsortedbyVendorTypeList[
                                                            index]),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  //
                                                  //
                                                  //************** Inside the column we added container to hold the image *************
                                                  Container(
                                                    width: double.infinity,
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              firesore
                                                                  .productsortedbyVendorTypeList[
                                                                      index]
                                                                  .img_url!)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  //
                                                  //
                                                  //
                                                  //*************** and added a column for adding texts and price of product **************
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        //
                                                        //
                                                        //
                                                        //************** Title text **************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_category,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        //
                                                        //
                                                        //
                                                        //************ Price text *************
                                                        Text(
                                                          firesore
                                                              .productsortedbyVendorTypeList[
                                                                  index]
                                                              .product_prize
                                                              .toDouble()
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                });
                          }),
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

  //
  //
  //
  //
  //
  //*******The function which the images of carousel images are send and return from here ***********//
  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
