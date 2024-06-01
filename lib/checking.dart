// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:trade_hub/model/usermodel.dart';
// import 'package:trade_hub/view/Modules/user/navigation%20bar.dart';
// import 'package:trade_hub/viewmodel/controller.dart';
// import 'package:trade_hub/viewmodel/firestore.dart';
//
// class Editprofileee extends StatefulWidget {
//   const Editprofileee({super.key});
//
//   @override
//   State<Editprofileee> createState() => _EditprofileeeState();
// }
//
// final selectedDate = DateTime.now();
//
// class _EditprofileeeState extends State<Editprofileee> {
//   @override
//   Widget build(BuildContext context) {
//     final hight = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Consumer<Firestore>(builder: (context, firestore, child) {
//           final data = firestore.userModel;
//           TextEditingController name = TextEditingController(text: data?.name);
//           TextEditingController dateofBirth =
//               TextEditingController(text: data?.dateOfBirth);
//           TextEditingController country =
//               TextEditingController(text: data?.country);
//           TextEditingController address =
//               TextEditingController(text: data?.deliveryAddress);
//           return ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Edit Profile',
//                       style: GoogleFonts.lexendDeca(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 27,
//                           color: const Color(0xffB7A6FC)),
//                     ),
//                   ],
//                 ),
//               ),
//               Consumer2<Controller, Firestore>(
//                   builder: (context, controller, firestore, child) {
//                 return FutureBuilder(
//                     future: firestore.fetchCurrentUser(
//                         FirebaseAuth.instance.currentUser!.uid),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.active) {
//                         const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             firestore.userModel?.profileImage == "" ||
//                                     firestore.userModel?.profileImage == null
//                                 ? ClipRRect(
//                                     borderRadius: BorderRadius.circular(100),
//                                     child: SizedBox(
//                                         height: 110,
//                                         width: 110,
//                                         child: Image.asset(
//                                           'assets/noImage.png',
//                                           fit: BoxFit.fill,
//                                         )),
//                                   )
//                                 : ClipRRect(
//                                     borderRadius: BorderRadius.circular(100),
//                                     child: SizedBox(
//                                       height: 110,
//                                       width: 110,
//                                       child: Image.network(
//                                         "${firestore.userModel?.profileImage}",
//                                         fit: BoxFit.fill,
//                                         // scale: 30,
//                                       ),
//                                     ),
//                                   ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 80, top: 60),
//                               child: InkWell(
//                                 onTap: () async {
//                                   await controller.addProfileImage();
//                                 },
//                                 child: Image.asset('assets/Group 12557.png'),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     });
//               }),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${data?.name}",
//                     style: GoogleFonts.dmSans(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                         color: const Color(0xff000000)),
//                   ),
//                 ],
//               ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${data?.email}",
//                     style: GoogleFonts.dmSans(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 10,
//                         color: const Color(0xffFFAB2D)),
//                   ),
//                 ],
//               ),
//
//               //=====================================================================================================================
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 17, top: 20),
//                 child: Text(
//                   'Name',
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                       color: const Color(0xff1D1E20)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
//                 child: Container(
//                   width: double.infinity,
//                   height: 44,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xff544C4C99)),
//                       borderRadius: BorderRadius.circular(6)),
//                   child: TextFormField(
//                     controller: name,
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "  ${data?.name}",
//                         hintStyle: const TextStyle(
//                             color: Color(0xff544C4C),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14)),
//                   ),
//                 ),
//               ),
//
//               //==========================================================================================
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 17, top: 10),
//                 child: Text(
//                   'Email',
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                       color: const Color(0xff1D1E20)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
//                 child: Container(
//                   width: double.infinity,
//                   height: 44,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xff544C4C99)),
//                       borderRadius: BorderRadius.circular(6)),
//                   child: TextFormField(
//                     enabled: false,
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "  ${data?.email}",
//                         hintStyle: const TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14)),
//                   ),
//                 ),
//               ),
//
//               //==========================================================================================
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 17, top: 10),
//                 child: Text(
//                   'Date of birth',
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                       color: const Color(0xff1D1E20)),
//                 ),
//               ),
//               Consumer<Controller>(builder: (context, controller, child) {
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 44,
//                   child: ListTile(
//
//                       // title: Text("${data?.dateOfBirth}"),
//                       title: TextFormField(
//                         decoration: InputDecoration(
//                           enabled: true,
//                           disabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: const Color(0xff544C4C99)),
//                               borderRadius: BorderRadius.circular(6)),
//                         ),
//                         controller: dateofBirth,
//                         enabled: false,
//                       ),
//                       trailing: IconButton(
//                         onPressed: () async {
//                           final picked = await showDatePicker(
//                               context: context,
//                               initialDate: selectedDate,
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime(2050));
//                           if (picked != null && picked != selectedDate) {
//                             final year = picked.year;
//                             final month = picked.month;
//                             final day = picked.day;
//
//                             controller.pickedDate = "$day/$month/$year";
//                             dateofBirth.text = "${controller.pickedDate}";
//
//                             print(controller.pickedDate);
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.keyboard_arrow_down,
//                           size: 30,
//                         ),
//                       )),
//                 );
//               }),
//
//               //==========================================================================================
//               Padding(
//                 padding: const EdgeInsets.only(left: 17, top: 10),
//                 child: Text(
//                   'Country/region',
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                       color: const Color(0xff1D1E20)),
//                 ),
//               ),
//               Consumer<Controller>(builder: (context, controller, child) {
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 44,
//                   child: ListTile(
//
//                       // title: Text("${data?.dateOfBirth}"),
//                       title: TextFormField(
//                         decoration: InputDecoration(
//                           enabled: true,
//                           disabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: const Color(0xff544C4C99)),
//                               borderRadius: BorderRadius.circular(6)),
//                         ),
//                         controller: country,
//                         enabled: false,
//                       ),
//                       trailing: IconButton(
//                         onPressed: () async {
//                           controller.showCountries(context);
//                           country.text = "${controller.selectedCountry.name}";
//                         },
//                         icon: const Icon(
//                           Icons.keyboard_arrow_down,
//                           size: 30,
//                         ),
//                       )),
//                 );
//               }),
//
//               //==========================================================================================
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 17, top: 10),
//                 child: Text(
//                   'Address',
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 15,
//                       color: const Color(0xff1D1E20)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
//                 child: Container(
//                   width: double.infinity,
//                   height: 44,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xff544C4C99)),
//                       borderRadius: BorderRadius.circular(6)),
//                   child: TextFormField(
//                     controller: address,
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "  ${data?.deliveryAddress}",
//                         hintStyle: const TextStyle(
//                             color: Color(0xff544C4C),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14)),
//                   ),
//                 ),
//               ),
//
//               //==========================================================================================
//
//               Consumer<Firestore>(builder: (context, firestore, child) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: InkWell(
//                         onTap: () {
//                           firestore.updateCurrentUserData(
//                               FirebaseAuth.instance.currentUser?.uid,
//                               UserModel(
//                                   country: country.text,
//                                   dateOfBirth: dateofBirth.text,
//                                   deliveryAddress: address.text,
//                                   email: "${data?.email}",
//                                   name: name.text,
//                                   userID: "${data?.userID}",
//                                   profileImage: ""));
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Navigationnn()));
//                         },
//                         child: Container(
//                           width: 147,
//                           height: 50,
//                           decoration: BoxDecoration(
//                               color: const Color(0xff7A00E6),
//                               borderRadius: BorderRadius.circular(36)),
//                           child: Center(
//                             child: Text(
//                               'Save Changes',
//                               style: GoogleFonts.inter(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 15,
//                                   color: const Color(0xffffffff)),
//                             ),
//                           ),
//                         ),
//                         //
//                         //
//                         //
//                       ),
//                     )
//                   ],
//                 );
//               })
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
