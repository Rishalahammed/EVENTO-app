import 'package:evento/model/addTolistModel.dart';
import 'package:evento/model/productmodel.dart';
import 'package:evento/pages/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  ProductModel? productModel;
  DetailsPage({super.key, required this.productModel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // Rating star function
  int _rating = 0;
  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  // final Uri phone = Uri.parse("tel://9567148342");
  //
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStore>(builder: (context, firestre, chiuld) {
      return Scaffold(
        //
        //
        //
        //*********** App bar ************
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
        //*************** Floating action button *****************
        floatingActionButton: SizedBox(
          height: 40,
          width: 90,
          child: FloatingActionButton(
            onPressed: () async {
              await firestre.addToList(
                  AddToListModel(
                      productModel: widget.productModel!,
                      vendorRegModel: firestre.selectedVendor!),
                  widget.productModel!.product_id,
                  firestre.selectedVendor!.userId);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Product is added to list")),
              );
            },
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Text("+ ADD",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ),
        //
        //
        //
        //******************** Body **********************
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future:
                firestre.fetchSelectedVendorById(widget.productModel!.vendorId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final Uri whatsapp = Uri.parse(
                  "https://wa.me/${firestre.selectedVendor!.whastappNo}");
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
                          Image.asset(
                            'assets/images/img1.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img2.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img3.jpg',
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
                      padding: const EdgeInsets.all(20),
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
                                backgroundImage:
                                    NetworkImage(widget.productModel!.img_url!),
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
                                    firestre.selectedVendor!.companyName,
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
                            height: 15,
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
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .55,
                                    child: Text(
                                      widget.productModel!.product_description,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: (17),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  //
                                  //
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //
                                  //
                                  Text(
                                    '₹ ${widget.productModel!.product_prize.toDouble().toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (20),
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                              //
                              //
                              //
                              //
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //
                                    //
                                    //
                                    //****************** Call button ********************
                                    // SizedBox(
                                    //   width: 80,
                                    //   height: 35,
                                    //   child: ElevatedButton(
                                    //       onPressed: () {},
                                    //       style: ButtonStyle(
                                    //         shape: MaterialStatePropertyAll(
                                    //           RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius.circular(10),
                                    //           ),
                                    //         ),
                                    //         foregroundColor:
                                    //             const MaterialStatePropertyAll(
                                    //           Colors.white,
                                    //         ),
                                    //         backgroundColor: MaterialStateProperty.all(
                                    //           Colors.black54,
                                    //         ),
                                    //       ),
                                    //       child: const Text(
                                    //         "Call",
                                    //         style: TextStyle(
                                    //             fontSize: 15,
                                    //             fontWeight: FontWeight.bold),
                                    //       )),
                                    // ),
                                    //
                                    //
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    //
                                    //
                                    //
                                    //****************** Enquiry button ********************
                                    SizedBox(
                                      width: 100,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // final tele = "9567148342";
                                          launch(
                                              "tel://${firestre.selectedVendor!.mobNo}");
                                          // canLaunchUrl(phone);
                                          // launchUrl(url)
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          foregroundColor:
                                              const MaterialStatePropertyAll(
                                            Colors.white,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black54),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.call,
                                              size: 15,
                                            ),
                                            Text(
                                              "Call",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //
                                    //
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //
                                    //
                                    SizedBox(
                                      width: 110,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          launchUrl(whatsapp);
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          foregroundColor:
                                              const MaterialStatePropertyAll(
                                            Colors.white,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black54),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                                "assets/images/whatsapp.png",
                                                height: 15),
                                            const Text(
                                              "Message",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    //
                                  ],
                                ),
                              )
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
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                //
                                //
                                //
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Balloon Decorators',
                                        style: TextStyle(
                                          fontSize: (15),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'Birthday Party',
                                        style: TextStyle(
                                          fontSize: (15),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'Name ceremony',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: (15),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'Baby shower',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: (15),
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'Light Decorators',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: (15),
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
                          //
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${firestre.selectedVendor!.address}\n${firestre.selectedVendor!.city},${firestre.selectedVendor!.state}",
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
                            height: 30,
                          ),
                          //
                          //
                          //
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Available on -",
                                    style: TextStyle(
                                      fontSize: 12,
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
                            height: 40,
                          ),
                          //
                          //
                          //
                          Container(
                            height: 90,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  //
                                  //
                                  //
                                  const Text(
                                    'Rate Us',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //
                                  //
                                  //
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //*************** Row contain rating stars ****************
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: _rating >= 1
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(1),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: _rating >= 2
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(2),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: _rating >= 3
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(3),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: _rating >= 4
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(4),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: _rating >= 5
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                        onTap: () => rate(5),
                                      )
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
                            ),
                          ),
                          //
                          //
                          //
                          //
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    });
  }
}
