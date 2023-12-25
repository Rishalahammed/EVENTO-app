import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:project_0/firebase_auth.dart';

import '../../firebase_auth.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/image02.png',
                          height: 270,
                        ),
                      ),

                      const Column(
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
                        ],
                      ),

                      const SizedBox(
                        height: 7,
                      ),

                      const Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Just some details to get you in..!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: name,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Username'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Full Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: email,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Email/Phone'),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please Enter valid Email';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Password box
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: password,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Password'),
                          ),
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'Please Enter Password of min length 8';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Password box
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: confirmpassword,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            label: Text('Confirm Password'),
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
                      ),

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
                          //----------------------------------------------------------------------
                          onPressed: () {
                            signup(
                              email.text.trim(),
                              password.text.trim(),
                              name.text.trim(),
                            );
                            formkey.currentState!.validate();
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

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tab(
                              icon:
                                  Image.asset(height: 35, "assets/google.png")),
                          const SizedBox(
                            width: 20,
                          ),
                          Tab(
                              icon: Image.asset(
                                  height: 30, "assets/facebook.png")),
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
                                          builder: (context) =>
                                              const LoginPage(),
                                        ),
                                      ) as String);
                                    },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launch(String s) {}
}
