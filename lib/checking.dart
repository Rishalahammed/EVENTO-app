// import 'package:flutter/material.dart';
// import 'package:project_0/pages/login.dart';
// import 'package:scroll_page_view/pager/page_controller.dart';
// import 'package:scroll_page_view/pager/scroll_page_view.dart';
//
// class exPage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // ignore: constant_identifier_names
//   static const _scroll_images = [
//     'assets/slider1.jpg',
//     'assets/slider2.jpg',
//     'assets/slider3.jpg',
//     'assets/slider4.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: Navigation(),
//       // appBar: AppBar(backgroundColor: Colors.orange),
//       //
//       //
//       //
//       //*******The Carousel sliding image which is using constantly defined images from top ***********//
//       body: Padding(
//         padding: const EdgeInsets.only(
//           top: 60,
//           left: 5,
//           right: 5,
//         ),
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: SizedBox(
//                 height: 200,
//                 child: ScrollPageView(
//                   controller: ScrollPageController(),
//                   children:
//                       _scroll_images.map((image) => _imageView(image)).toList(),
//                 ),
//               ),
//             ),
//             //
//             //
//             //
//             //
//             //
//             //*******Elevated buttons added for navigating through pages ***********//
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(5, 25, 5, 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginPage(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(120, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         backgroundColor: Colors.teal,
//                         elevation: 4,
//                       ),
//                       child: const Text(
//                         "Management",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(120, 50),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           backgroundColor: Colors.teal,
//                           elevation: 4,
//                         ),
//                         child: const Text(
//                           "Product",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(120, 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         backgroundColor: Colors.teal,
//                         elevation: 4,
//                       ),
//                       child: const Text(
//                         "Caterers",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //
//             //
//             //
//             //********** Text added popular events ***********
//             SliverToBoxAdapter(
//               child: Container(
//                 alignment: Alignment.bottomLeft,
//                 height: 50,
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('POPULAR EVENTS',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ),
//             ),
//             //
//             //
//             //
//             //
//             //********* Columns holding rows of products **********
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     //
//                     //
//                     //
//                     //
//                     //********* First row of products **********
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //
//                         //
//                         //
//                         //********* First column in the first row ********
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 165,
//                               height: 105,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.asset(
//                                   "assets/img1.png",
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Colorful umbrellas for\ndecoration ",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     " ₹ 150",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.amber),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         //
//                         //
//                         //
//                         //********* Sized box for spacing between columns ********
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         //
//                         //
//                         //
//                         //********* Second column in the first row ********
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 165,
//                               height: 105,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.asset(
//                                   "assets/img2.jpg",
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Beautiful Real flowers",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     " ₹ 1000",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.amber),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                     //
//                     //
//                     //
//                     //
//                     //
//                     // ************Second row ************
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           //
//                           //
//                           //
//                           //********* First column in the second row ********
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 165,
//                                 height: 105,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.asset(
//                                     "assets/img3.jpg",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Illumination bulbs for\ndecoration",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "₹ 500",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.amber),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           //
//                           //
//                           //
//                           //********* Sized box for spacing between columns ********
//                           SizedBox(
//                             width: 20,
//                           ),
//                           //
//                           //
//                           //
//                           //********* Second column in the second row ********
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 165,
//                                 height: 105,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.asset(
//                                     "assets/img4.jpg",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Birthday party products",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "₹ 2500",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.amber),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     //
//                     //
//                     //
//                     //
//                     //
//                     //************* Third row *************
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 165,
//                                 height: 105,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.asset(
//                                     "assets/slider1.jpg",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "Product",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       "₹ 1000",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.amber),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 165,
//                                 height: 105,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.asset(
//                                     "assets/slider1.jpg",
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "Product",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       "₹ 1000",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.amber),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   //
//   //
//   //
//   //
//   //
//   //*******The function which the images of carousel images are send and return from here ***********//
//   Widget _imageView(String image) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Image.asset(image, fit: BoxFit.cover),
//       ),
//     );
//   }
// }
