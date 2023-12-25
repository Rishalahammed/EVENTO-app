import 'package:evento/pages/user_pages/usersignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../firebase_auth.dart';
// import 'package:project_0/firebase_auth.dart';
// import 'package:project_0/pages/user_pages/usersignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;
  bool obscureText = true;

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

                      const Column(
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
                      const SizedBox(
                        height: 7,
                      ),

                      const Column(
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

                      const SizedBox(
                        height: 25,
                      ),

                      ///Username box
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else {
                            return null;
                          }
                        },
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            label: Text('Email')),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Password box
                      TextFormField(
                        controller: password,
                        obscureText: obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          } else {
                            return null;
                          }
                        },
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            )),
                      ),

                      const SizedBox(
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
                                const Text(
                                  "Remember me",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
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
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await login(email.text, password.text);
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
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

                      const SizedBox(
                        height: 9,
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
                        height: 9,
                      ),

                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Don't have an account ?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: "  Sign Up",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage(),
                                        ),
                                      ) as String);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.teal),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
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

                      const SizedBox(
                        height: 9,
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
