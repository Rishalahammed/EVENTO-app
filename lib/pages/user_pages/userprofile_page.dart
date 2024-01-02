import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/pages/user_pages/bookings_page.dart';
import 'package:evento/pages/user_pages/useredit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'changepassword_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CollectionReference reference = FirebaseFirestore.instance.collection("user");
  final db = FirebaseFirestore.instance;
  // final id = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            //
            //
            //********************* Stacked the background image and profile image **********************
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/profile1.png",
                ),
                //
                //
                //****************** Profile image ********************
                Positioned(
                  bottom: -50,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/people.png"),
                      ),
                    ),
                  ),
                ),
                //
                //
                //
              ],
            ),
            //
            //
            //
            const SizedBox(
              height: 65,
            ),
            //
            //
            //
            //***************** Username text ******************
            Text(
              "Edward joe",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            //
            //
            const Text(
              "edward@gmail.com",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
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
            //*************** Edit profile button ****************
            SizedBox(
              height: 35,
              width: 120,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    width: 2,
                  ),
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
              ),
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
            //**************** Text buttons of option in profile ****************
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  //
                  //
                  const Divider(
                    thickness: 2,
                    color: Colors.black54,
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingsPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Bookings & Orders",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                    child: const Text("Change Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54)),
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
                  const Divider(
                    thickness: 2,
                    color: Colors.black54,
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
                  //************** Row added for multiple text button in a row **************
                  Row(
                    children: [
                      //
                      //
                      //
                      TextButton(
                        onPressed: () {},
                        child: const Text("Language",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54)),
                      ),
                      //
                      //
                      //
                      const Spacer(),
                      //
                      //
                      //
                      TextButton(
                        onPressed: () {},
                        child: const Text("English",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue)),
                      ),
                      //
                      //
                      //
                    ],
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
                  TextButton(
                    onPressed: () {},
                    child: const Text("About",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54)),
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
                ],
              ),
            ),
            //
            //
            //
            SizedBox(
              height: 35,
              width: 120,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    width: 2,
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //
            //
            //
            const SizedBox(
              height: 80,
            ),
            //
            //
            //
          ],
        ),
      ),
    );
  }
}
