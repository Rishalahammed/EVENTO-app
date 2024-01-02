import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  //
  //
  //
  //
  //********************* Body part **********************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            //
            //
            //********************* Key icon on top **********************
            const Icon(
              Icons.key_rounded,
              size: 50,
            ),
            //
            //
            //
            const SizedBox(
              height: 30,
            ),
            //
            //
            //
            //********************* Text forgot password *********************
            const Text(
              "Forgot passsword ?",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
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
            //****************** Text added sud text ******************
            const Text(
              "No worries,we'll send you reset instructions",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            //
            //
            //
            const SizedBox(
              height: 50,
            ),
            //
            //
            //
            //********************** Email form field *******************
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
                  'Email',
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
              height: 30,
            ),
            //
            //
            //
            //********************** Button *************************
            SizedBox(
              height: 45,
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
                  passwordReset();
                },
                child: const Text("Reset password",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            //
            //
            //
            const SizedBox(
              height: 50,
            ),
            //
            //
            //
            //******************** Back to login button *********************
            TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black54),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  Text("Back to log in"),
                ],
              ),
            ),
            //
            //
            //
          ],
        ),
      ),
    );
  }

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //************************ Password reset function *************************
  //
  //
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link send! Check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(20),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
              e.message.toString(),
            ),
          );
        },
      );
    }
  }
}
