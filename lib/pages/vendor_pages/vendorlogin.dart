import 'package:evento/firebase_auth.dart';
import 'package:evento/pages/vendor_pages/vendorsignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VendorloginPage extends StatefulWidget {
  const VendorloginPage({super.key});

  @override
  State<VendorloginPage> createState() => _VendorloginPageState();
}

class _VendorloginPageState extends State<VendorloginPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
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
                        'assets/images/selling.png',
                        height: 350,
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
                            'Login',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //
                        //
                        //
                        /// Sized box for space btw login and paragraph
                        SizedBox(
                          height: 7,
                        ),
                        //
                        //
                        //
                        Text(
                          "Glad you're back !",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                    //******************** Username text field ******************
                    TextFormField(
                      controller: email,
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        label: Text('Email'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
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
                    //******************** Password text field ******************
                    TextFormField(
                      controller: password,
                      obscureText: obscureText,
                      style: const TextStyle(fontSize: 17, color: Colors.black),
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
                            setState(
                              () {
                                obscureText = !obscureText;
                              },
                            );
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
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
                      height: 15,
                    ),
                    //
                    //
                    //
                    //**************** Login button ***************
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
                            await Vendorlogin(
                                email.text, password.text, context);
                          }
                        },
                        child: const Text('Login'),
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
                    //*************** Forgot password **************
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                      ),
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
                    //***************** Row contain divider and or text *****************
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: 10,
                            color: Colors.black,
                          ),
                        ),
                        //
                        //
                        Text(
                          'Or',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        //
                        //
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
                      height: 15,
                    ),
                    //
                    //
                    //
                    //*************** Row with social-media icons **************
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
                    //
                    //
                    //
                    const SizedBox(
                      height: 15,
                    ),
                    //
                    //
                    //
                    //******************* Text to signup *****************
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
                                        const VendorsignUpPage(),
                                  ),
                                ) as String);
                              },
                          ),
                        ],
                      ),
                    ),
                    //
                    //
                    //
                    const SizedBox(
                      height: 25,
                    )
                    //
                    //
                    //
                    //
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launch(String s) {}
}
