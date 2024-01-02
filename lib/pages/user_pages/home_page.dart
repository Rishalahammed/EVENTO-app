import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/user_pages/productdetails_page.dart';
import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.all(10),
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

                        maxHeight: MediaQuery.of(context).size.height,
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            //
                            //
                            //
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              //Physics added to scroll whole page without grid scroll
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 220,
                                childAspectRatio: 2 / 2.3,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: 15,
                              //
                              //
                              //
                              //************* built column as the item builder and wrapped
                              // in inkwell to give on tap function **********************
                              itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  await fireobj.fetchCurrentUser();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const DetailsPage(),
                                  //   ),
                                  // );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //
                                    //
                                    //
                                    //************** Inside the column we added container to hold the image *************
                                    Container(
                                      width: double.infinity,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/img1.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    //*************** and added a column for adding texts and price of product **************
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //
                                          //
                                          //
                                          //************** Title text **************
                                          Text(
                                            "hhhh",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //
                                          //
                                          //
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //
                                          //
                                          //
                                          //************ Price text *************
                                          Text(
                                            "80000",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
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
                          ),
                          //
                          //
                          //
                          //// 2- Second tab bar view *******************************************************************
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            //
                            //
                            //
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              //Physics added to scroll whole page without grid scroll
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 220,
                                childAspectRatio: 2 / 2.3,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: 15,
                              //
                              //
                              //
                              //************* built column as the item builder and wrapped
                              // in inkwell to give on tap function **********************
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailsPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //
                                    //
                                    //
                                    //************** Inside the column we added container to hold the image *************
                                    Container(
                                      width: double.infinity,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/img1.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    //*************** and added a column for adding texts and price of product **************
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //
                                          //
                                          //
                                          //************** Title text **************
                                          Text(
                                            "hhhh",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //
                                          //
                                          //
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //
                                          //
                                          //
                                          //************ Price text *************
                                          Text(
                                            "80000",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
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
                          ),
                          //
                          //
                          //
                          //// 3- third tab bar view *******************************************************************
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            //
                            //
                            //
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              //Physics added to scroll whole page without grid scroll
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 220,
                                childAspectRatio: 2 / 2.3,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: 15,
                              //
                              //
                              //
                              //************* built column as the item builder and wrapped
                              // in inkwell to give on tap function **********************
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailsPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //
                                    //
                                    //
                                    //************** Inside the column we added container to hold the image *************
                                    Container(
                                      width: double.infinity,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/img1.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    //*************** and added a column for adding texts and price of product **************
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //
                                          //
                                          //
                                          //************** Title text **************
                                          Text(
                                            "hhhh",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //
                                          //
                                          //
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //
                                          //
                                          //
                                          //************ Price text *************
                                          Text(
                                            "80000",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
