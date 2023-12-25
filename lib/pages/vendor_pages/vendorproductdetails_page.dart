import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class VendordetailsPage extends StatefulWidget {
  const VendordetailsPage({super.key});

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

  @override
  Widget build(BuildContext context) {
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
            // Navigator.pop(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ListPage(),
            //   ),
            // );
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
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            //
            //
            //****************** Carousel image added on top ******************
            SizedBox(
              height: 370,
              child: ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset(
                    'assets/img1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/img2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/img3.jpg',
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
              width: double.infinity,

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
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img1.png")),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.white,
                          // shape: BoxShape.circle,
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
                            "Heaven Art & Events",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (25),
                              color: Colors.white,
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
                              )
                            ],
                          ),
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
                    children: [
                      //
                      //
                      //
                      //***************** Column in row of details ****************
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Outdoor Open Stage And Sitting \n'
                            'With Lights',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (17),
                              color: Colors.white,
                            ),
                          ),
                          //
                          //
                          SizedBox(
                            height: 10,
                          ),
                          //
                          //
                          Text(
                            '₹ 80,000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (20),
                              color: Colors.white,
                            ),
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
            ),
            //
            //
            //
            //
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //
                  //
                  //
                  SizedBox(
                    height: 20,
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
                              Text(
                                'Name ceremony',
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
                  SizedBox(
                    height: 20,
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
                  //
                  //
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Shop No 5 Excel Complex,  Azadi Road ,  \n Eranakulam - '
                        '68011 (opposite police station)',
                        style: TextStyle(
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
                  const Text(
                    'Mon - Sat   10:00 am - 10:00 pm',
                    style: TextStyle(
                      fontSize: (15),
                      fontWeight: FontWeight.bold,
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
                  //
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
