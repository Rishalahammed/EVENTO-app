import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../user_pages/usersignUp.dart';

class VendorloginPage extends StatefulWidget {
  const VendorloginPage({super.key});

  @override
  State<VendorloginPage> createState() => _VendorloginPageState();
}

class _VendorloginPageState extends State<VendorloginPage> {
  var name = TextEditingController();
  var password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                          'assets/image01.png',
                          height: 350,
                        ),
                      ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      /// Sized box for space btw login and paragraph
                      SizedBox(
                        height: 7,
                      ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Glad you're back !",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      ///Username box
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Username')),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      ///Password box
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Password')),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember me",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            //Checkbox
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
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
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print(name);
                            }
                          },
                          child: Text('Login'),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        "________________________       Or       ________________________",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(
                        height: 9,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tab(
                              icon:
                                  Image.asset(height: 35, "assets/google.png")),
                          SizedBox(
                            width: 20,
                          ),
                          Tab(
                              icon: Image.asset(
                                  height: 30, "assets/facebook.png")),
                        ],
                      ),

                      SizedBox(
                        height: 9,
                      ),

                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account ?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: "  Sign Up",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpPage(),
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
