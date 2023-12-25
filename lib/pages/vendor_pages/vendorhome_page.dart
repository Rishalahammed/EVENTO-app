import 'package:evento/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:flutter/material.dart';
// import 'package:project_0/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class VendordhomePage extends StatefulWidget {
  const VendordhomePage({super.key});

  @override
  State<VendordhomePage> createState() => _VendordhomePageState();
}

class _VendordhomePageState extends State<VendordhomePage>
    with TickerProviderStateMixin {
  // ignore: constant_identifier_names
  static const _scroll_images = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.jpg',
    'assets/slider4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      // bottomNavigationBar: Navigation(),
      // appBar: AppBar(backgroundColor: Colors.orange),
      //
      //
      //
      //*******The Carousel sliding image which is using constantly defined images from top ***********//
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 5,
          right: 5,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ScrollPageView(
                  controller: ScrollPageController(),
                  children:
                      _scroll_images.map((image) => _imageView(image)).toList(),
                ),
              ),
            ),
            //
            //
            //
            //
            //
            //*******Elevated buttons added for navigating through pages ***********//
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(5)),
                      child: TabBar(
                        controller: tabController,
                        labelPadding: EdgeInsets.all(0),
                        unselectedLabelColor: Colors.teal,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal),
                        tabs: [
                          Tab(
                            child: Container(
                              height: 60,
                              width: 160,
                              decoration: BoxDecoration(),
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
                          Tab(
                            child: Container(
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
                          Tab(
                            child: Container(
                              height: 60,
                              width: 160,
                              decoration: BoxDecoration(),
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                    child: Text('POPULAR EVENTS',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 200, //minimum height
                      minWidth: 200, // minimum width

                      maxHeight: MediaQuery.of(context).size.height,
                      //maximum height set to 100% of vertical height

                      maxWidth: MediaQuery.of(context).size.width,
                      //maximum width set to 100% of width
                    ),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20),
                            itemCount: 15,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendordetailsPage(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/img1.png"),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "hhhh",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "80000",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20),
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendordetailsPage(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/img1.png"),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "jjjjj",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "80000",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20),
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendordetailsPage(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/img1.png"),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "kkkkk",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "80000",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                  ),
                ],
              ),
            ),
          ],
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
