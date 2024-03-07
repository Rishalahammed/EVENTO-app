import 'package:evento/pages/vendor_pages/vendorsignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../firebase_auth.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool value = false;
  BackendController backendController = BackendController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //
                //
                //
                //*************** Image added to the top **************
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    'assets/images/image02.png',
                    height: 270,
                  ),
                ),
                //
                //
                //
                //***************** Column with texts ***************
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Signup',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //
                    //
                    //
                    SizedBox(
                      height: 7,
                    ),
                    //
                    //
                    //
                    Text(
                      "Just some details to get you in..!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                //******************** Username text field ******************
                TextFormField(
                  controller: username,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.teal,
                  cursorHeight: 20,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    label: Text(
                      'Username',
                      style: TextStyle(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Full Name';
                    } else {
                      return null;
                    }
                  },
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
                TextFormField(
                  controller: email,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    label: Text(
                      'Email/Phone',
                      style: TextStyle(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
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
                TextFormField(
                  controller: password,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    label: Text(
                      'Password',
                      style: TextStyle(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Please Enter Password of min length 8';
                    } else {
                      return null;
                    }
                  },
                ),
                //
                //
                //
                //

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmpassword,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    label: Text(
                      'Confirm Password',
                      style: TextStyle(color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                //
                //
                //
                //
                const SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    //
                    //
                    //
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await backendController.signup(
                          email.text.trim(),
                          password.text.trim(),
                          username.text.trim(),
                          context,
                        );
                      }
                    },
                    child: const Text('Signup'),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                //
                //
                //

                const SizedBox(
                  height: 10,
                ),
                //
                //
                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tab(
                        icon: Image.asset(
                            height: 35, "assets/images/google.png")),
                    const SizedBox(
                      width: 20,
                    ),
                    Tab(
                        icon: Image.asset(
                            height: 30, "assets/images/facebook.png")),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account ?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "  Login",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch(Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                ) as String);
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //
                //
                //
                //******************* Container of merchant login ********************
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        "Elevate your sales game on our dedicated selling platform.",
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VendorsignUpPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.teal.shade800,
                            backgroundColor: Colors.teal.shade100,
                            side: BorderSide(
                              width: 2,
                              color: Colors.teal.shade800,
                            ),
                          ),
                          child: const Text('Login as Merchant'),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //
                //
                const SizedBox(
                  height: 9,
                ),
                //
                //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launch(String s) {}
}
