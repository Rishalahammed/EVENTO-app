import 'package:flutter/material.dart';

import '../user_pages/userprofile_page.dart';
// import 'package:project_0/pages/user_pages/userprofile_page.dart';

class VendoreditProfile extends StatefulWidget {
  const VendoreditProfile({super.key});

  @override
  State<VendoreditProfile> createState() => _VendoreditProfileState();
}

class _VendoreditProfileState extends State<VendoreditProfile> {
  var editusername = TextEditingController();
  var editemail = TextEditingController();
  var editcity = TextEditingController();
  var editstate = TextEditingController();
  var editmobile = TextEditingController();
  var editwhatsapp = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool value = false;
  // Uint8List? _image;
  //
  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  //
  //
  //
  //
  //********************* Body *************************

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
      //********************** Body *******************************
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
              height: 15,
            ),
            //
            //
            //
            //******************** Text Edit profile ***********************
            const Text(
              "EDIT PROFILE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 35,
            ),
            //
            //
            //
            //************** Profile image and stacked icon button here ******************
            Stack(
              clipBehavior: Clip.none,
              children: [
                // _image != null
                //     ? Container(
                //         height: 110,
                //         width: 110,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           image: DecorationImage(
                //             fit: BoxFit.cover,
                //             image: MemoryImage(_image!),
                //           ),
                //         ),
                //       )
                //     :
                //
                //
                //
                //*************** Image holding container *****************
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/people.png"),
                    ),
                  ),
                ),
                //
                //
                //
                //*************** Icon added for profile picture update ****************
                Positioned(
                  top: 80,
                  left: 105,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_outlined, size: 20),
                  ),
                ),
                //
                //
                //
                //
              ],
            ),
            //
            //
            //
            //
            const SizedBox(
              height: 50,
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
                      controller: editusername,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
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
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
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
                    //******************** Text field of email *****************
                    TextFormField(
                      controller: editemail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
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
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
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
                    //******************** Row contain city & state field *****************
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        //
                        //
                        //******************** Text field of state *****************
                        Flexible(
                          child: TextField(
                            controller: editcity,
                            decoration: const InputDecoration(
                              labelText: "City",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        //
                        const SizedBox(
                          width: 15,
                        ),
                        //
                        //
                        //
                        //******************** Text field of city *****************
                        Flexible(
                          child: TextField(
                            controller: editstate,
                            decoration: const InputDecoration(
                              labelText: "State",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.5, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        //
                      ],
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
                    //******************** Text field for mobile *****************
                    TextFormField(
                      controller: editmobile,
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
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
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
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
                    //******************** Text field for Whatsapp ******************
                    TextFormField(
                      controller: editwhatsapp,
                      decoration: const InputDecoration(
                        labelText: 'Whatsapp',
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
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    //
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
              if (formkey.currentState!.validate()) {
                print(editcity);
                print(editstate);
                print(editusername);
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }
}
