import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/model/allusermodel.dart';
import 'package:evento/model/usermodel.dart';
import 'package:evento/model/vendor_reg_model.dart';
import 'package:evento/pages/bottom_bar.dart';
import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/user_pages/login.dart';
import 'package:evento/pages/vdbottom_bar.dart';
import 'package:evento/pages/vendor_pages/vendorlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackendController {
  final auth = FirebaseAuth.instance;
  FireStore firestoreobj = FireStore();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //
  //
  //
  /////////////////////////////////////////////////////////////////////////////////////////////
  //************************ User signup authentication and data saving ***********************
  //
  signup(emailAddress, password, username, context) async {
    try {
      final credential = await auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then(
        (value) {
          return firestoreobj
              .addUserdetails(
                  value.user!.uid,
                  UserModel(
                      userName: username, userEmail: emailAddress, imgUrl: ""))
              .then(
            (value) {
              const type = "user";
              return firestoreobj
                  .addtoall(
                      FirebaseAuth.instance.currentUser!.uid,
                      AllUserModel(
                        email: emailAddress,
                        type: type,
                      ))
                  .then((value) {
                successSnackBar(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              });
              //
              //
              //
            },
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  //
  //
  //
  /////////////////////////////////////////////////////////////////////////////////////////////
  //********************* Management signup authentication and data saving ********************
  //
  vendorSignUp(
    companyname,
    emailAddress,
    mobile,
    whatsapp,
    address,
    password,
    city,
    state,
    context,
    vendorType,
  ) async {
    try {
      final credential = await auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          //
          //
          /////----------------- storing data in firebase
          .then(
        (value) {
          return firestoreobj
              .addNewVandor(
                  value.user!.uid,
                  VendorRegModel(
                      image: "",
                      address: address,
                      city: city,
                      state: state,
                      type: vendorType,
                      companyName: companyname,
                      email: emailAddress,
                      mobNo: mobile,
                      whastappNo: whatsapp))
              //
              //
              /////---------------- passing data to all users collection and its type
              .then(
            (value) {
              const type = "vendor";
              return firestoreobj
                  .addtoall(
                      FirebaseAuth.instance.currentUser!.uid,
                      AllUserModel(
                        email: emailAddress,
                        type: type,
                      ))
                  //
                  //
                  /////----------------- Pushing to the home page after the sign up
                  .then((value) {
                successSnackBar(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VendorloginPage(),
                    ),
                    (route) => false);
              });

              //
              //
              //
            },
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  //
  //
  //
  /////////////////////////////////////////////////////////////////////////////////////////////
  //******************* Product seller signup authentication and data saving ******************
  //
  // sellersignup(companyname, emailAddress, mobile, whatsapp, address, password,
  //     context) async {
  //   try {
  //     final credential = await auth
  //         .createUserWithEmailAndPassword(
  //       email: emailAddress,
  //       password: password,
  //     )
  //         //
  //         //
  //         /////----------------- storing data in firebase
  //         .then(
  //       (value) {
  //         return firestoreobj
  //             .addproductseller(
  //                 value.user!.uid,
  //                 ProductsellerModel(
  //                     companyName: companyname,
  //                     email: emailAddress,
  //                     mobNo: mobile,
  //                     whastappNo: whatsapp))
  //             //
  //             //
  //             /////---------------- passing data to all users collection and its type
  //             .then(
  //           (value) {
  //             const type = "vendor";
  //             return firestoreobj
  //                 .addtoall(
  //                     FirebaseAuth.instance.currentUser!.uid,
  //                     AllUserModel(
  //                       email: emailAddress,
  //                       type: type,
  //                     ))
  //                 //
  //                 //
  //                 /////----------------- Pushing to the home page after the sign up
  //                 .then((value) {
  //               successSnackBar(context);
  //               Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => const VendorloginPage(),
  //                   ),
  //                   (route) => false);
  //             });
  //             //
  //             //
  //             //
  //           },
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //
  //
  //
  /////////////////////////////////////////////////////////////////////////////////////////////
  //******************** Food caterer signup authentication and data saving *******************
  //
  // caterersignup(companyname, emailAddress, mobile, whatsapp, address, password,
  //     context) async {
  //   try {
  //     final credential = await auth
  //         .createUserWithEmailAndPassword(
  //       email: emailAddress,
  //       password: password,
  //     )
  //         //
  //         //
  //         /////----------------- storing data in firebase
  //         .then((value) {
  //       return firestoreobj
  //           .addfoodcaterer(
  //               value.user!.uid,
  //               VendorRegModel(
  //                   companyName: companyname,
  //                   email: emailAddress,
  //                   mobNo: mobile,
  //                   whastappNo: whatsapp))
  //           //
  //           //
  //           /////---------------- passing data to all users collection and its type
  //           .then(
  //         (value) {
  //           const type = "vendor";
  //           return firestoreobj
  //               .addtoall(
  //                   FirebaseAuth.instance.currentUser!.uid,
  //                   AllUserModel(
  //                     email: emailAddress,
  //                     type: type,
  //                   ))
  //               //
  //               //
  //               /////----------------- Pushing to the home page after the sign up
  //               .then((value) {
  //             successSnackBar(context);
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => const VendorloginPage(),
  //                 ),
  //                 (route) => false);
  //           });
  //           //
  //           //
  //           //
  //         },
  //       );
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future changePAssword() async {
    await auth.sendPasswordResetEmail(
        email: FirebaseAuth.instance.currentUser!.email.toString());
    return 0;
  }

  successSnackBar(context) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Account created successful,now login with registered email address")));
  }
//********************** User login authentication **************************
  // login(email, password, context) async {
  //   try {
  //     final credential = await auth
  //         .signInWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         )
  //         .then(
  //           (value) => Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(builder: (context) => const BottomBar()),
  //               (route) => false),
  //         );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  ////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////
  // dynamic currentUID = FirebaseAuth.instance.currentUser!.uid;
  loginn(email, password, context, selected) async {
    try {
      final currentUID = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        setLoginPrefertrue();

        await Provider.of<FireStore>(context, listen: false)
            .fetchCurrentUserData(value.user!.uid)
            .then((model) async {
          if (selected == 0) {
            if (model.type == "user") {
              return await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomBar()),
                  (route) => false);
            } else {
              return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("The user not exist in give email address")));
            }
          } else {
            if (model.type == "vendor") {
              return await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomBarvd()),
                  (route) => false);
            } else {
              return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("The user not exist in give email address")));
            }
          }
        });
      });
    } catch (e) {
      customeShowDiolog("$e", context);
    }
  }

  ///////
  ///////
  ///////

  customeShowDiolog(String title, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Text(title),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"))
        ],
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////

// Future<void> checkUser()async{
//   try{
//     CollectionReference reminderRef = firebaseFirestore
//         .collection('allCollection');
//     QuerySnapshot reminderSnapshot = await reminderRef
//         .where('Type', isEqualTo: 'user')
//         .get();
//     if(reminderSnapshot.)
//
//   }catch(e){
//     print(e);
//   }
// }

//////////////////////////////////////////////////////////////////////////////
// Future<void> checkUserType(String uid, context) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//   try {
//     QuerySnapshot querySnapshot =
//         await users.where('uid', isEqualTo: uid).get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       // Assuming there is only one document with the specified UID.
//       DocumentSnapshot userSnapshot = querySnapshot.docs.first;
//
//       // Access the "type" field from the document.
//       String userType = userSnapshot.data()?['type'];
//
//       // Navigate to the appropriate page based on the user type.
//       if (userType == 'user') {
//         // Navigate to user page.
//         Navigator.pushReplacementNamed(context, '/user');
//       } else if (userType == 'vendor') {
//         // Navigate to vendor page.
//         Navigator.pushReplacementNamed(context, '/vendor');
//       } else {
//         // Handle other user types or navigate to a default page.
//       }
//     } else {
//       // Handle the case where the user document does not exist.
//     }
//   } catch (e) {
//     print("Error: $e");
//     // Handle Firestore query errors.
//   }
// }

//////////////////////////////////////////////////////////////////////////////
  // Vendorlogin(email, password, context) async {
  //   try {
  //     final credential = await auth
  //         .signInWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         )
  //         .then(
  //           (value) => Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(builder: (context) => const BottomBarvd()),
  //               (route) => false),
  //         );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Management authentication and passing data to store

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Product seller authentication and passing data to store

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Food caterer authentication and passing data to store

  /////////////////////////////////////////////////////////////////////////////

  // Future<void> userLogin(String userEmail, String userPassword, context,
  //     String collectionName, pageName) async {
  //   try {
  //     print('tryingg.............');
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: userEmail, password: userPassword);
  //     final user = FirebaseAuth.instance.currentUser;
  //     // final emailVerified = user!.emailVerified;
  //     // print('Verification : $emailVerified');

  //     CollectionReference collection =
  //         firebaseFirestore.collection(collectionName);
  //     var userQuery = await collection.doc(user!.uid).get();
  //     if (userQuery.exists) {
  //       setLoginPrefertrue();
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => pageName),
  //           (route) => false);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('This email not registered')));

  //       // clearLoginFields();
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.toString())));
  //     if (e.code == 'user-not-found') {
  //       print("1 $e");
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('No user found')));
  //     } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
  //       print('2 $e');
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('No user found')));
  //     } else if (e.code == 'wrong-password') {
  //       print('3 $e');
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('Incorrect password')));
  //     }
  //   } catch (e) {
  //     print('4 $e');
  //   }
  //   // notifyListeners();
  // }

  ////////////////////////SAHRED PREFERENCE////////////////////////////////////

  // bool _isSignedIn = false;
  // bool get isSignedIn => _isSignedIn;
  //
  // Future<void> checkSignedIn() async {
  //   print('Checking Signin : $_isSignedIn');
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   _isSignedIn = sharedPreferences.getBool('is_signedIn') ?? false;
  //   // notifyListeners();
  // }

  // Future setSignIn() async {
  //   print('******calling setSigned in');
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.setBool('is_signedIn', true);
  //   _isSignedIn = true;
  //
  //   print("Is Signed in Home : $_isSignedIn");
  //   print("==================================================");
  //   checkSignedIn();
  //   // notifyListeners();
  // }

  // Future setSignOut() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.setBool('is_signedIn', false);
  //   _isSignedIn = false;
  //   checkSignedIn();
  //
  //   // notifyListeners();
  // }

  // checkLoginStatus(context) async {
  //   bool isLoggedIn = await getLoggedPrefer();
  //   if (isLoggedIn == true) {
  //     final uid = FirebaseAuth.instance.currentUser!.uid;
  //
  //     storeInstence.fetchcurrentUserforType(uid).then((value) {
  //       if (value == "USER") {
  //         storeInstence.fetchcurrentDataforLogin(uid, context, 0);
  //       }
  //       if (value == "SHOP") {
  //         storeInstence.fetchcurrentDataforLogin(uid, context, 1);
  //       }
  //     });
  //   } else {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const Welcomeee()));
  //   }
  // }
}

Future<bool> getLoggedPrefer() async {
  print("bbnbnjbnkjdm");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

void setLoginPrefertrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  getLoggedPrefer();
}

void setLoginPreferfalse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  getLoggedPrefer();
}
