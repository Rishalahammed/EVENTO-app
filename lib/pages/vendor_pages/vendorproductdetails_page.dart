import 'package:evento/model/productmodel.dart';
import 'package:evento/pages/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class VendordetailsPage extends StatefulWidget {
  ProductModel? productModel;
  VendordetailsPage({super.key, required this.productModel});

  @override
  State<VendordetailsPage> createState() => _VendordetailsPageState();
}

class _VendordetailsPageState extends State<VendordetailsPage> {
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
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //
      //
      //********************* App bar ***********************
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      ),
      //
      //
      //
      //******************** Body **********************
      backgroundColor: Colors.white,
      body: Consumer<FireStore>(builder: (context, firestore, child) {
        return FutureBuilder(
            future: firestore
                .fetchSelectedVendorById(widget.productModel!.vendorId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //
                    //
                    //
                    //****************** Carousel image added on top ******************
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: ImageSlideshow(
                        indicatorColor: Colors.teal,
                        indicatorRadius: 3,
                        onPageChanged: (value) {
                          debugPrint('Page changed: $value');
                        },
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Image.network(
                            widget.productModel!.img_url!,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            widget.productModel!.img_url!,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            widget.productModel!.img_url!,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    //
                    //
                    //
                    //
                    //********************* Container holding image and details ******************
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.teal,
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      //
                      //
                      //
                      //***************** Column inside the container ******************
                      child: Column(
                        children: [
                          Row(
                            children: [
                              //
                              //
                              //
                              //**************** Profile image container *****************
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  firestore.selectedVendor!.image,
                                ),
                              ),
                              //
                              //
                              //
                              //
                              const SizedBox(
                                width: 20,
                              ),
                              //
                              //
                              //
                              //************** Column contain subtext ****************
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    firestore.selectedVendor!.companyName
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (25),
                                      color: Colors.white,
                                    ),
                                  ),
                                  //
                                  //
                                  //
                                  //**************** Rating stars *******************
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: _rating >= 1
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(1),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: _rating >= 2
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(2),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: _rating >= 3
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(3),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: _rating >= 4
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(4),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: _rating >= 5
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(5),
                                      ),
                                    ],
                                  ),
                                  //
                                  //
                                  //
                                ],
                              ),
                            ],
                          ),
                          //
                          //
                          //
                          const SizedBox(
                            height: 25,
                          ),
                          //************** Row contains details ****************
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //
                              //
                              //
                              //***************** Column in row of details ****************
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.productModel!.product_description,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (18),
                                      color: Colors.white,
                                    ),
                                  ),
                                  //
                                  //
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  //
                                  Text(
                                    '₹ ${widget.productModel!.product_prize}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (22),
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
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
                    //
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    //
                    //
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //
                          //
                          const Divider(
                            color: Colors.black45,
                            thickness: 2,
                            // indent: 20,
                            // endIndent: 20,
                          ),
                          //
                          //
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                //
                                //
                                //
                                Row(
                                  children: [
                                    Text(
                                      'Category  :  ',
                                      style: TextStyle(
                                        fontSize: (18),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.productModel!.product_category,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //
                          //
                          //
                          const Divider(
                            color: Colors.black45,
                            thickness: 2,
                            // indent: 20,
                            // endIndent: 20,
                          ),
                          //
                          //
                          //
                          const SizedBox(
                            height: 25,
                          ),
                          //
                          //
                          //
                          //************** Row contain Location icon and details ****************
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.teal,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${firestore.selectedVendor!.city}, ${firestore.selectedVendor!.state}\n${firestore.selectedVendor!.address}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (15),
                                ),
                              ),
                            ],
                          ),
                          //
                          //
                          //
                          const SizedBox(
                            height: 35,
                          ),
                          //
                          //
                          //
                          //************** Available time text and objects ****************
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Available on -",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  'Mon - Sat   10:00 am - 10:00 pm',
                                  style: TextStyle(
                                    fontSize: (15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          //
                          //
                          const SizedBox(
                            height: 50,
                          ),
                          //
                          //
                          //
                          //
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
