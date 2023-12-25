import 'package:evento/pages/vendor_pages/vendoraddproduct.dart';
import 'package:evento/pages/vendor_pages/vendorbookings_page.dart';
import 'package:evento/pages/vendor_pages/vendorchangepassword_page.dart';
import 'package:evento/pages/vendor_pages/vendorenquiry_page.dart';
import 'package:evento/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:flutter/material.dart';

import '../user_pages/useredit_profile.dart';
// import 'package:project_0/pages/user_pages/useredit_profile.dart';
// import 'package:project_0/pages/vendor_pages/vendoraddproduct.dart';
// import 'package:project_0/pages/vendor_pages/vendorbookings_page.dart';
// import 'package:project_0/pages/vendor_pages/vendorchangepassword_page.dart';
// import 'package:project_0/pages/vendor_pages/vendorenquiry_page.dart';
// import 'package:project_0/pages/vendor_pages/vendorproductdetails_page.dart';

class VendorprofilePage extends StatefulWidget {
  const VendorprofilePage({super.key});

  @override
  State<VendorprofilePage> createState() => _VendorprofilePageState();
}

class _VendorprofilePageState extends State<VendorprofilePage> {
  final List<CategoryList> _categorys = [
    CategoryList("Inauguration Events"),
    CategoryList("Birthday Parties"),
    CategoryList("pre wedding events"),
    CategoryList("Inauguration Events"),
    CategoryList("Birthday Parties "),
    CategoryList("pre wedding events"),
    CategoryList("pre wedding events"),
    CategoryList("pre wedding events"),
    CategoryList("pre wedding events"),
  ];

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  //
  //
  //
  //************************ Body ******************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            //
            //
            //******************* Image and circle avatar added ******************
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/profile1.png",
                ),
                //
                //
                //
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/people.png"),
                  ),
                ),
              ],
            ),
            //
            //
            //
            //***************** Two Icons added ******************
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EnquiryPage()),
                      );
                    },
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  //
                  //
                  //
                  //*********************** Popup menu icon **********************
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(
                      Icons.dehaze_rounded,
                      size: 30,
                    ),
                    itemBuilder: (context) => [
                      //
                      //
                      //
                      //**************** First item in the menu *****************
                      PopupMenuItem(
                        child: Row(
                          children: [
                            //
                            //
                            //
                            //*************** Text settings of menu ***************
                            Text(" Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Spacer(),
                            //
                            //
                            //
                            //**************** Close button for menu ***************
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VendorprofilePage(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      //
                      //
                      //
                      //***************** Divider in the menu *****************
                      PopupMenuItem(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      //
                      //
                      //
                      //***************** Second item in the menu *****************
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VendorbookingsPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Booking & Orders',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //***************** Third item in the menu *****************
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VendorchangePassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //***************** Sixth item in the menu *****************
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'About',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //***************** Logout button in the menu *****************
                      PopupMenuItem(
                        child: SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2, color: Colors.black54),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.black45,
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
                ],
              ),
            ),
            //
            //
            //
            SizedBox(
              height: 25,
            ),
            //
            //
            //
            //**************** Company name text ****************
            Text(
              "KVS Caters",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
            //**************** Rating star *****************
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: _rating >= 1 ? Colors.orange : Colors.grey,
                  ),
                  onTap: () => rate(1),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: _rating >= 2 ? Colors.orange : Colors.grey,
                  ),
                  onTap: () => rate(2),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: _rating >= 3 ? Colors.orange : Colors.grey,
                  ),
                  onTap: () => rate(3),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: _rating >= 4 ? Colors.orange : Colors.grey,
                  ),
                  onTap: () => rate(4),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.star,
                    size: 15,
                    color: _rating >= 5 ? Colors.orange : Colors.grey,
                  ),
                  onTap: () => rate(5),
                )
              ],
            ),
            //
            //
            //
            SizedBox(
              height: 10,
            ),
            //
            //
            //
            //********************* Edit profile button ************************
            SizedBox(
              height: 35,
              width: 120,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //
            //
            //
            SizedBox(
              height: 15,
            ),
            //
            //
            //******************** Column with grids *********************
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  //
                  //
                  //
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 220,
                        childAspectRatio: 2 / 2.5,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20),
                    itemCount: _categorys.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VendordetailsPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.black26,
                          ),
                        ),
                        //
                        //
                        //
                        //************ Column with image container and column with texts ***********
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            //
                            //
                            //***************** Container with image ********************
                            Container(
                              width: double.infinity,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/img1.png"),
                                ),
                                borderRadius: BorderRadius.circular(10),
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
                            //************* Column with texts *****************
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _categorys[index]._categoryhint!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                  ),
                ),
              ],
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
      //************** Floating action button ************
      floatingActionButton: SizedBox(
        height: 40,
        width: 150,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddproductPage(),
              ),
            );
          },
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "+ ADD PRODUCT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //
      //
      //
    );
  }
}

class CategoryList {
  String? _categoryhint;

  CategoryList(this._categoryhint);
}
