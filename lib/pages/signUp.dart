// import 'package:flutter/material.dart';
// import 'package:project_0/firebase_auth.dart';
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//
//   bool value = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Form(
//                 key: formkey,
//                 child: Container(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         child: Image.asset(
//                           'assets/image02.png',
//                           height: 270,
//                         ),
//                       ),
//
//                       const Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               'Signup',
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontSize: 35,
//                                   letterSpacing: 1,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(
//                         height: 7,
//                       ),
//
//                       const Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Just some details to get you in..!",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(
//                         height: 25,
//                       ),
//
//                       SizedBox(
//                         height: 45,
//                         child: TextField(
//                           controller: name,
//                           style: const TextStyle(
//                               fontSize: 17, color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               label: Text('Username')),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       SizedBox(
//                         height: 45,
//                         child: TextField(
//                           controller: email,
//                           style: const TextStyle(
//                               fontSize: 17, color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               label: Text('Email/Phone')),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       ///Password box
//                       SizedBox(
//                         height: 45,
//                         child: TextField(
//                           controller: password,
//                           style: const TextStyle(
//                               fontSize: 17, color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               label: Text('Password')),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       ///Password box
//                       SizedBox(
//                         height: 45,
//                         child: TextField(
//                           controller: confirmpassword,
//                           style: const TextStyle(
//                               fontSize: 17, color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(10),
//                                 ),
//                               ),
//                               label: Text('Confirm Password')),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 25,
//                       ),
//
//                       SizedBox(
//                         height: 40,
//                         width: MediaQuery.of(context).size.width,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             foregroundColor: Colors.white,
//                             disabledForegroundColor: Colors.grey,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           //
//                           //
//                           //
//                           //----------------------------------------------------------------------
//                           onPressed: () {
//                             // signup(email.text, password.text);
//                             login(email.text, password.text);
//                           },
//                           child: const Text('Signup'),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       const Text(
//                         "________________________       Or       ________________________",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 10,
//                       ),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Tab(
//                               icon:
//                                   Image.asset(height: 35, "assets/google.png")),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Tab(
//                               icon: Image.asset(
//                                   height: 30, "assets/facebook.png")),
//                         ],
//                       ),
//
//                       const SizedBox(
//                         height: 10,
//                       ),
//
//                       Column(
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                 const TextSpan(
//                                   text: "Already Registered ?",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 TextSpan(
//                                   text: "  Login",
//                                   style: const TextStyle(color: Colors.blue),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// //
// // Future<void> login() async {
// //   final auth = FirebaseAuth.instance;
// //   auth.signInWithEmailAndPassword(
// //     email: email.text,
// //     password: password.text,
// //   );
// //}
// }
