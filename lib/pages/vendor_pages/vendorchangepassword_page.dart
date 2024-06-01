import 'package:evento/pages/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:project_0/pages/user_pages/userprofile_page.dart';

class VendorchangePassword extends StatefulWidget {
  const VendorchangePassword({super.key});

  @override
  State<VendorchangePassword> createState() => _VendorchangePasswordState();
}

class _VendorchangePasswordState extends State<VendorchangePassword> {
  var currentpass = TextEditingController();
  var newpass = TextEditingController();
  var confirmpass = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 30,
            shadows: [
              Shadow(
                color: Colors.white,
                blurRadius: 18,
              ),
            ],
          ),
        ),
      ),
      //
      //
      //
      //******************** Body ********************************
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            //
            //
            //******************* Image added to the top ********************
            Image.asset(
              "assets/images/profile1.png",
              fit: BoxFit.cover,
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 20,
            ),
            //
            //
            //
            //******************** Text Edit profile ***********************
            const Text(
              "CHANGE PASSWORD",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 70,
            ),
            //
            //
            //
            //
            //********************* Form starts from here ********************
            Form(
              key: formkey, //Key for the form
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    ListTile(
                      title: Text(
                        FirebaseAuth.instance.currentUser!.email.toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      trailing: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: const Text("Change Password"),
                                  content: const Text(
                                      "Do you want to send the reset password link to your email address"),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal,
                                        foregroundColor: Colors.white,
                                        disabledForegroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        BackendController bc =
                                            BackendController();
                                        bc.changePAssword();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Check your registerd email")));
                                      },
                                      child: const Text("Send"),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          )),
                    )
                    //
                    //
                    //
                    //******************** Text field of username ************
                    // TextFormField(
                    //   cursorColor: Colors.teal,
                    //   // obscureText: true,
                    //   maxLength: 20,
                    //   controller: currentpass,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Current Password',
                    //     counterText: "",
                    //     labelStyle: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.black87,
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 1.5,
                    //         color: Colors.teal,
                    //       ),
                    //     ),
                    //   ),
                    //   onSaved: (String? value) {
                    //     // This optional block of code can be used to run
                    //     // code when the user saves the form.
                    //   },
                    //   validator: (String? value) {
                    //     if (value!.trim().isEmpty) {
                    //       return 'This field is required';
                    //     } else if (value.length < 8) {
                    //       return "Password must contain atleast 8 character";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    //
                    //
                    //
                    //
                    ,
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    //
                    //
                    //******************** Text field of email *****************
                    // TextFormField(
                    //   cursorColor: Colors.teal,
                    //   // obscureText: true,
                    //   maxLength: 20,
                    //   controller: newpass,
                    //   decoration: const InputDecoration(
                    //     labelText: 'New Password',
                    //     counterText: "",
                    //     labelStyle: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.black87,
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 1.5,
                    //         color: Colors.teal,
                    //       ),
                    //     ),
                    //   ),
                    //   onSaved: (String? value) {
                    //     // This optional block of code can be used to run
                    //     // code when the user saves the form.
                    //   },
                    //   validator: (String? value) {
                    //     if (value!.trim().isEmpty) {
                    //       return 'This field is required';
                    //     } else if (value.length < 8) {
                    //       return "Password must contain atleast 8 character";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    //
                    //
                    //
                    //
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    //
                    //
                    //******************** Text field for mobile *****************
                    // TextFormField(
                    //   cursorColor: Colors.teal,
                    //   // obscureText: true,
                    //   maxLength: 20,
                    //   controller: confirmpass,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Confirm Password',
                    //     counterText: "",
                    //     labelStyle: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.black87,
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 1.5,
                    //         color: Colors.teal,
                    //       ),
                    //     ),
                    //   ),
                    //   onSaved: (String? value) {
                    //     // This optional block of code can be used to run
                    //     // code when the user saves the form.
                    //   },
                    //   validator: (String? value) {
                    //     if (value!.trim().isEmpty) {
                    //       return 'This field is required';
                    //     } else if (value != newpass.text) {
                    //       return "Password do not match !";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // //
                    //
                    //
                    //
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: TextButton(
            //         onPressed: () {},
            //         child: const Text("forgot password",
            //             style: TextStyle(color: Colors.blue)),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: SizedBox(
      //     height: 40,
      //     width: MediaQuery.of(context).size.width,
      //     child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.teal,
      //         foregroundColor: Colors.white,
      //         disabledForegroundColor: Colors.grey,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //       ),
      //       onPressed: () {
      //         if (formkey.currentState!.validate()) {}
      //       },
      //       child: const Text('Save'),
      //     ),
      //   ),
      // ),
    );
  }
}
