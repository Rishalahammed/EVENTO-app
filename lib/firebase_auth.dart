import 'package:evento/pages/bottom_bar.dart';
import 'package:evento/pages/firestore.dart';
import 'package:evento/pages/vdbottom_bar.dart';
import 'package:evento/product_dt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
FireStore firestoreobj = FireStore();

//
//
//////////////////////////////////////////////////////////////////////////////
//************* User signup authentication ***************
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
            .addUserdetails(value.user!.uid,
                ExModel(userName: username, userEmail: emailAddress))
            .then(
          (value) {
            const type = "user";
            return firestoreobj
                .addtoall(
                  FirebaseAuth.instance.currentUser!.uid,
                  emailAddress,
                  type,
                )
                .then(
                  (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBar(),
                      ),
                      (route) => false),
                );
          },
        );
      },
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

//////////////////////////////////////////////////////////////////////////////
//
//
//
//
//********************** User login authentication **************************
login(email, password, context) async {
  try {
    final credential = await auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomBar()),
              (route) => false),
        );
  } catch (e) {
    print(e);
  }
}

//////////////////////////////////////////////////////////////////////////////
Vendorlogin(email, password, context) async {
  try {
    final credential = await auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomBarvd()),
              (route) => false),
        );
  } catch (e) {
    print(e);
  }
}

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Management authentication and passing data to store
managementsignup(companyname, emailAddress, mobile, whatsapp, address, password,
    context) async {
  try {
    final credential = await auth
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then(
      (value) {
        return firestoreobj
            .addmanagement(
          value.user!.uid,
          companyname,
          emailAddress,
          mobile,
          address,
          whatsapp,
        )
            //
            //
            //Passing data to store in the table os all users of app
            .then(
          (value) {
            const type = "vendor";
            return firestoreobj
                .addtoall(
                  FirebaseAuth.instance.currentUser!.uid,
                  emailAddress,
                  type,
                )
                //
                //
                //Pushing to the home page after the sign up
                .then(
                  (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBarvd(),
                      ),
                      (route) => false),
                );
            //
            //
            //
          },
        );
        //
        //
        //
      },
    );
  } catch (e) {
    print(e);
  }
}

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Product seller authentication and passing data to store
sellersignup(companyname, emailAddress, mobile, whatsapp, address, password,
    context) async {
  try {
    final credential = await auth
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then(
      (value) {
        return firestoreobj
            .addproductseller(
          value.user!.uid,
          companyname,
          emailAddress,
          mobile,
          address,
          whatsapp,
        )
            //
            //
            //Passing data to store in the table os all users of app
            .then(
          (value) {
            const type = "vendor";
            return firestoreobj
                .addtoall(
                  FirebaseAuth.instance.currentUser!.uid,
                  emailAddress,
                  type,
                )
                //
                //
                //Pushing to the home page after the sign up
                .then(
                  (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomBarvd(),
                      ),
                      (route) => false),
                );
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

//////////////////////////////////////////////////////////////////////////////
//
//
//
//Food caterer authentication and passing data to store
caterersignup(companyname, emailAddress, mobile, whatsapp, address, password,
    context) async {
  try {
    final credential = await auth
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        // final email =credential.user!.email;
        // final uid =credential.user!.uid;
        .then((value) {
      return firestoreobj
          .addfoodcaterer(
        value.user!.uid,
        companyname,
        emailAddress,
        mobile,
        address,
        whatsapp,
      )
          //
          //
          //Passing data to store in the table os all users of app
          .then(
        (value) {
          const type = "vendor";
          return firestoreobj
              .addtoall(
                FirebaseAuth.instance.currentUser!.uid,
                emailAddress,
                type,
              )
              //
              //
              //Pushing to the home page after the sign up
              .then(
                (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBarvd(),
                    ),
                    (route) => false),
              );
          //
          //
          //
        },
      );
    });
  } catch (e) {
    print(e);
  }
}
