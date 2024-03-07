import 'package:evento/model/allusermodel.dart';
import 'package:evento/pages/bottom_bar.dart';
import 'package:evento/pages/firebase_auth.dart';
import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/user_pages/login.dart';
import 'package:evento/pages/vdbottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:project_0/pages/user_pages/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FireStore fireStoreController = FireStore();
  BackendController backendController = BackendController();
  // checkLoginStatus(context) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   bool isLoggedIn = await getLoggedPrefer();
  //   if (isLoggedIn == true) {
  //     final uid = FirebaseAuth.instance.currentUser!.uid;
  //     print(uid);
  //     print("=============================================");
  //     await fireStoreController.fetchAllUserForLogintype(uid).then((value) {
  //       userData = value;
  //     });
  //     print(userData!.type);
  //     print("=============================================");
  //     if (userData!.type == "vendor") {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => const BottomBarvd()),
  //       );
  //     } else {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => const BottomBar()),
  //       );
  //     }
  //     // Navigator.of(context).push(
  //     //   MaterialPageRoute(builder: (context) => BottomBar()),
  //     // );
  //     // storeInstence.fetchcurrentUserforType(uid).then((value) {
  //     //   if (value == "USER") {
  //     //     storeInstence.fetchcurrentDataforLogin(uid, context, 0);
  //     //   }
  //     //   if (value == "SHOP") {
  //     //     storeInstence.fetchcurrentDataforLogin(uid, context, 1);
  //     //   }
  //     // });
  //   } else {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const LoginPage()));
  //   }

  AllUserModel? userData;
  checkLoginPreference() async {
    final credential = FirebaseAuth.instance.currentUser;
    if (credential == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      await fireStoreController
          .fetchAllUserForLogintype(credential.uid)
          .then((value) {
        userData = value;
      });

      if (userData!.type == "vendor") {
        Provider.of<FireStore>(context, listen: false)
            .fetchCurrentUserData(FirebaseAuth.instance.currentUser!.uid);
        print("V E N D O R");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomBarvd(),
            ),
            (route) => false);
      } else {
        Provider.of<FireStore>(context, listen: false)
            .fetchCurrentUserData(FirebaseAuth.instance.currentUser!.uid);
        print("U S E R");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("hellooo");
    Future.delayed(const Duration(seconds: 3), () {
      print("hellooo");
      checkLoginPreference();
    });
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Image(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/splashimage.png'),
      ),
    );
  }
}
