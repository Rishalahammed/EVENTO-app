import 'package:evento/pages/firebase_auth.dart';
import 'package:evento/pages/firestore.dart';
import 'package:evento/splash_screen.dart';
import 'package:evento/pages/vendor_pages/vendoraddproduct.dart';
import 'package:evento/pages/vendor_pages/vendorbookings_page.dart';
import 'package:evento/pages/vendor_pages/vendorchangepassword_page.dart';
import 'package:evento/pages/vendor_pages/vendoredit_profile.dart';
import 'package:evento/pages/vendor_pages/vendorenquiry_page.dart';
import 'package:evento/pages/vendor_pages/vendorproductdetails_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorprofilePage extends StatefulWidget {
  const VendorprofilePage({super.key});

  @override
  State<VendorprofilePage> createState() => _VendorprofilePageState();
}

class _VendorprofilePageState extends State<VendorprofilePage> {
  //
  //
  //
  //************** Dummy list **************
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
      body: Consumer<FireStore>(builder: (context, firestore, child) {
        return FutureBuilder(
            future: firestore.fetchCurrentUserDetailData(
                "All-Vendor", FirebaseAuth.instance.currentUser!.uid,),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
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
                          "assets/images/profile1.png",
                        ),
                        //
                        //
                        //
                        Positioned(
                          bottom: -50,
                          child: firestore.currentvendorModel!.image.isEmpty
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage("assets/images/people.png"))
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      firestore.currentvendorModel!.image)),
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
                          // IconButton(
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const EnquiryPage()),
                          //     );
                          //   },
                          //   icon: const Icon(
                          //     Icons.assignment_outlined,
                          //     size: 30,
                          //   ),
                          // ),
                          //
                          //
                          //
                          const Spacer(),
                          //
                          //
                          //
                          //*********************** Popup menu icon **********************
                          PopupMenuButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            icon: const Icon(
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
                                    const Text(
                                      " Settings",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    const Spacer(),
                                    //
                                    //
                                    //
                                    //**************** Close button for menu ***************
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              //
                              //
                              //***************** Divider in the menu *****************
                              const PopupMenuItem(
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              //
                              //
                              //
                              //***************** First item in the menu *****************
                              // PopupMenuItem(
                              //   child: TextButton(
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               const VendorbookingsPage(),
                              //         ),
                              //       );
                              //     },
                              //     child: const Text(
                              //       'Booking & Orders',
                              //       style: TextStyle(
                              //           color: Colors.black45,
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              // ),
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
                                        builder: (context) =>
                                            const VendorchangePassword(),
                                      ),
                                    );
                                  },
                                  child: const Text(
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
                              //***************** Third item in the menu *****************
                              PopupMenuItem(
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
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
                                      side: const BorderSide(
                                        width: 2,
                                        color: Colors.black54,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      FirebaseAuth.instance
                                          .signOut()
                                          .then((value) {
                                        setLoginPreferfalse();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Splash(),
                                                ),
                                                (route) => false);
                                      });
                                    },
                                    child: const Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    //
                    //
                    //**************** Company name text ****************
                    Text(
                      firestore.currentvendorModel!.companyName.toUpperCase(),
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
                    const SizedBox(
                      height: 15,
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
                          side: const BorderSide(
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VendoreditProfile(),
                            ),
                          );
                        },
                        child: const Text(
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
                    const SizedBox(
                      height: 15,
                    ),
                    //
                    //
                    //******************** Column with grids *********************
                    FutureBuilder(
                        future: firestore.fetchAllProductVendorAdded(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = firestore.currentVendorproductList;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                //
                                //
                                //
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 220,
                                          childAspectRatio: 2 / 2.5,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VendordetailsPage(
                                                  productModel: data[index]),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                image: NetworkImage(
                                                    data[index].img_url!),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                          //************* Column with texts *****************
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].product_category,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //
                                                //
                                                //
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                //
                                                //
                                                //

                                                Text(
                                                  data[index]
                                                      .product_prize
                                                      .toDouble()
                                                      .toString(),
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
                          );
                        }),
                    //
                    //
                    //
                  ],
                ),
              );
            });
      }),
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
                builder: (context) => const AddproductPage(),
              ),
            );
          },
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
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
