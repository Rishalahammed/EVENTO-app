import 'package:evento/firebase_auth.dart';
import 'package:evento/pages/vendor_pages/vendorlogin.dart';
import 'package:flutter/material.dart';

class VendorsignUpPage extends StatefulWidget {
  const VendorsignUpPage({super.key});

  @override
  State<VendorsignUpPage> createState() => _VendorsignUpPageState();
}

class _VendorsignUpPageState extends State<VendorsignUpPage> {
  TextEditingController companyname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController address = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool value = false;

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
                    'assets/images/selling.png',
                    // height: 100,
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
                      "Seamlessly list, discover, and transact with a global community.",
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
                  controller: companyname,
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
                      'Company Name',
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
                      return 'Please Enter Company Name';
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
                    if (value!.isEmpty || !value.contains("@gmail.com")) {
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
                  controller: mobile,
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
                      'Mobile',
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
                      return 'Please Enter Mobile Number';
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
                TextFormField(
                  controller: whatsapp,
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
                      'Whatsapp',
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
                      return 'Please Enter Whatsapp Number';
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
                SizedBox(
                  height: 100,
                  child: TextFormField(
                    maxLines: 4,
                    controller: address,
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
                        'Address',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.teal),
                      ),
                      hintText: "  e.g., 123 Main St, City & Landmark",
                      hintStyle: TextStyle(fontSize: 15),
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
                        return 'Please Enter Your Company Address';
                      } else {
                        return null;
                      }
                    },
                  ),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Create a strong password",
                    ),
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
                    //----------------------------------------------------------------------
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.teal.shade50,
                          contentPadding: const EdgeInsets.all(15),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                //
                                //
                                const SizedBox(
                                  height: 5,
                                ),
                                //
                                //
                                //
                                const Text(
                                  "Choose your type of account want to create:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                //
                                //
                                //
                                const SizedBox(
                                  height: 5,
                                ),
                                //
                                //
                                //
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.teal,
                                    fixedSize: const Size(double.maxFinite, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  //
                                  //
                                  onPressed: () {
                                    formkey.currentState!.validate();
                                    managementsignup(
                                      companyname.text.trim(),
                                      email.text.trim(),
                                      mobile.text.trim(),
                                      whatsapp.text.trim(),
                                      address.text.trim(),
                                      password.text.trim(),
                                      context,
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Log in as Management"),
                                      Icon(Icons.keyboard_arrow_right_rounded),
                                    ],
                                  ),
                                ),
                                //
                                //
                                ElevatedButton(
                                  onPressed: () {
                                    formkey.currentState!.validate();
                                    sellersignup(
                                      companyname.text.trim(),
                                      email.text.trim(),
                                      mobile.text.trim(),
                                      whatsapp.text.trim(),
                                      address.text.trim(),
                                      password.text.trim(),
                                      context,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.teal,
                                    fixedSize: const Size(double.maxFinite, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Log in as Product Seller"),
                                      Icon(Icons.keyboard_arrow_right_rounded),
                                    ],
                                  ),
                                ),
                                //
                                //
                                ElevatedButton(
                                  onPressed: () {
                                    formkey.currentState!.validate();
                                    caterersignup(
                                      companyname.text.trim(),
                                      email.text.trim(),
                                      mobile.text.trim(),
                                      whatsapp.text.trim(),
                                      address.text.trim(),
                                      password.text.trim(),
                                      context,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.teal,
                                    fixedSize: const Size(double.maxFinite, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Log in as Food Caterer"),
                                      Icon(Icons.keyboard_arrow_right_rounded),
                                    ],
                                  ),
                                ),
                                //
                                //
                                //
                              ],
                            ),
                          ),
                        ),
                      );
                      // formkey.currentState!.validate();
                      //
                      // vdsignup(
                      //   companyname.text.trim(),
                      //   email.text.trim(),
                      //   mobile.text.trim(),
                      //   whatsapp.text.trim(),
                      //   address.text.trim(),
                      //   password.text.trim(),
                      // );
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

                const SizedBox(
                  height: 10,
                ),

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
                //
                //
                //
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Registered ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VendorloginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //
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
//
// Future<void> login() async {
//   final auth = FirebaseAuth.instance;
//   auth.signInWithEmailAndPassword(
//     email: email.text,
//     password: password.text,
//   );
//}
}
