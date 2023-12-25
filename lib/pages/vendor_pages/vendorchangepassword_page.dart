import 'package:flutter/material.dart';

import '../user_pages/userprofile_page.dart';
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
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 30,
            shadows: [Shadow(color: Colors.white, blurRadius: 18)],
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
              "assets/profile1.png",
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
                  children: [
                    //
                    //
                    //
                    //******************** Text field of username ************
                    TextFormField(
                      obscureText: true,
                      // obscuringCharacter: "*",
                      maxLength: 20,
                      controller: currentpass,
                      decoration: const InputDecoration(
                        labelText: 'Curret Password',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
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
                    //******************** Text field of email *****************
                    TextFormField(
                      obscureText: true,
                      // obscuringCharacter: "*",
                      maxLength: 20,
                      controller: newpass,
                      decoration: const InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
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
                    TextFormField(
                      obscureText: true,
                      // obscuringCharacter: "*",
                      maxLength: 20,
                      controller: confirmpass,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(fontWeight: FontWeight.w600),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.blue),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    //
                    //
                    //
                    //
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("forgot password"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
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
              if (formkey.currentState!.validate()) {}
            },
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}
