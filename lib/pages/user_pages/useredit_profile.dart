import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var editusername = TextEditingController();
  var editemail = TextEditingController();
  var editcity = TextEditingController();
  var editstate = TextEditingController();
  var editmobile = TextEditingController();
  var editwhatsapp = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // late PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();

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
            Navigator.pop(context);
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
              "assets/images/profile1.png",
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
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/people.png"),
                      ),
                    ),
                  ),
                  //
                  //
                  //
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => Container(
                            padding: EdgeInsets.all(20),
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //
                                //
                                //
                                Text(
                                  "Choose Profile Photo",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                //
                                //
                                //
                                SizedBox(
                                  height: 15,
                                ),
                                //
                                //
                                //
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //
                                    //
                                    //
                                    InkWell(
                                      onTap: () {
                                        print("camera");
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.camera),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                    InkWell(
                                      onTap: () {
                                        print("gallery");
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.image),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //
                                    //
                                    //
                                  ],
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
                //
                //
                //
                //*************** Icon added for profile picture update ****************
                Positioned(
                  bottom: 5,
                  right: -10,
                  child: Icon(Icons.add_a_photo_outlined),
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
                      // validator: (String? value) {
                      //   return (value != null && value.contains('@'))
                      //       ? 'Do not use the @ char.'
                      //       : null;
                      // },
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
                    //
                    //
                    //******************** Text field for mobile *****************
                    // TextFormField(
                    //   controller: edit mobile,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Mobile',
                    //     labelStyle: TextStyle(fontWeight: FontWeight.w600),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide:
                    //           BorderSide(width: 1.5, color: Colors.blue),
                    //     ),
                    //   ),
                    //   onSaved: (String? value) {
                    //     // This optional block of code can be used to run
                    //     // code when the user saves the form.
                    //   },
                    //   validator: (String? value) {
                    //     return (value != null && value.contains('@'))
                    //         ? 'Do not use the @ char.'
                    //         : null;
                    //   },
                    // ),
                    // //
                    // //
                    // //
                    // //
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // //
                    // //
                    // //
                    // //******************** Text field for Whatsapp ******************
                    // TextFormField(
                    //   controller: editwhatsapp,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Whatsapp',
                    //     labelStyle: TextStyle(fontWeight: FontWeight.w600),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide:
                    //           BorderSide(width: 1.5, color: Colors.blue),
                    //     ),
                    //   ),
                    //   onSaved: (String? value) {
                    //     // This optional block of code can be used to run
                    //     // code when the user saves the form.
                    //   },
                    //   validator: (String? value) {
                    //     return (value != null && value.contains('@'))
                    //         ? 'Do not use the @ char.'
                    //         : null;
                    //   },
                    // ),
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

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = pickedFile as PickedFile;
  //   });
  // }
  // void takePhotos(ImageSource source) async {
  //   final ImagePicker _imagePicker = ImagePicker();
  //   XFile? _file = await _imagePicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No image");
  // }
}
