import 'package:evento/pages/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

//
//
//Firebase connection
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//
//
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    // final db = FirebaseFirestore.instance;
    String? type;
    //
    //
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
      // StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     //
      //     //
      //     //
      //     if (snapshot.hasData) {
      //       firestoreobj.fetchUsertype().then(
      //         (value) {
      //           print(value);
      //           if (value == "user") {
      //             return BottomBar();
      //             print(value);
      //           } else if (value == "vendor") {
      //             return BottomBarvd();
      //             print(value);
      //           }
      //         },
      //       );
      //       //
      //       //
      //       //
      //     }
      //     return LoginPage();
      //
      //     //
      //     //
      //     //
      //   },
      // ),
    );
  }
}
