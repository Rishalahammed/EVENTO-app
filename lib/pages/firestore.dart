import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/product_dt.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  final CollectionReference management =
      FirebaseFirestore.instance.collection("managememnt");
  final db = FirebaseFirestore.instance;

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //********************* adding user details *********************
  Future addUserdetails(uid, ExModel exmodel) async {
    final userCollection = db.collection("user").doc(uid);
    await userCollection.set(exmodel.toMap(uid));
  }

  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //adding management vendor type
  addmanagement(uid, companyname, email, mobile, address, whatsapp) async {
    final vendorCollection = db.collection("management");
    await vendorCollection.doc(uid).set(
      {
        "id": uid,
        "Company name": companyname,
        "Email": email,
        "Mobile No": mobile,
        "Whatsapp No": whatsapp,
        "Type": "management",
      },
    );
  }

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //adding productseller vendor type
  addproductseller(uid, companyname, email, mobile, address, whatsapp) async {
    final vendorCollection = db.collection("productseller");
    await vendorCollection.doc(uid).set(
      {
        "id": uid,
        "Company name": companyname,
        "Email": email,
        "Mobile No": mobile,
        "Address": address,
        "Whatsapp No": whatsapp,
      },
    );
  }

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //adding foodcaterer vendor type
  addfoodcaterer(uid, companyname, email, mobile, address, whatsapp) async {
    final vendorCollection = db.collection("foodcaterer");
    await vendorCollection.doc(uid).set(
      {
        "id": uid,
        "Company name": companyname,
        "Email": email,
        "Mobile No": mobile,
        "Whatsapp No": whatsapp,
      },
    );
  }

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //adding details of all to one table
  Future addtoall(uid, email, type) async {
    final userCollection = db.collection("allCollection");
    await userCollection.doc(uid).set({
      "Uid": uid,
      "email": email,
      "Type": type,
    });
  }

  //
  //
  //
  ///////////////////////////////////////////////////////////////////////////
  //
  //
  //adding product details of vendor
  addProduct(uid, UserModel userModel) async {
    final vendor = db.collection("management");
    final produ = vendor.doc(uid).collection("products").doc();
    await produ.set(userModel.toMap(produ.id)
        //     {
        //   "id": produ.id,
        //   "Description": description,
        //   "Category": category,
        //   "Prize": prize,
        // }
        //
        );
  }

  //
  //
  //
  //

  //
  //
  //
  //
  addproduct() async {
    final doc = db
        .collection("vendor")
        .doc()
        .collection("Management")
        .doc("UID")
        .collection("produ")
        .doc();
    doc.set({"id": doc.id});
  }

  delete(docid) {
    db
        .collection("vendor")
        .doc()
        .collection("Management")
        .doc("UID")
        .collection("produ")
        .doc(docid)
        .delete();
  }

  List<UserModel> allUsers = [];
  UserModel? usermodel;

  fetchDatafromStore() async {
    QuerySnapshot querySnapshot = await db
        .collection("vendor")
        .doc()
        .collection("Management")
        .doc("UID")
        .collection("produ")
        .get();

    allUsers = querySnapshot.docs.map((e) {
      return UserModel.fromMap(e.data() as Map<String, dynamic>);
    }).toList();

///////////////////////////////////////////////////////////////////////////////
    final docSnapshot = await db
        .collection("vendor")
        .doc()
        .collection("Management")
        .doc("UID")
        .collection("produ")
        .doc()
        .get();

    usermodel = UserModel.fromMap(docSnapshot.data()!);
  }

//////////////////////////FETCH EX////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

  UserModel? userModelobj; // created object of model class
  //
  String name = ""; //variable for direct getting
  //
  //function for fetch
  //
  fetchCurrentUser() async {
    print("First");
    // user details are fetched to variable as map form
    //
    DocumentReference<Map<String, dynamic>> currentUserDoc =
        db.collection("user").doc(FirebaseAuth.instance.currentUser!.uid);
    //assigned fetching data to a variable
    //
    final snapshot = await currentUserDoc.get();
    //if condition to fetch data
    //
    if (snapshot.exists) {
      print("object");
      //normal method used to fetch dat to a variable declared before
      name = snapshot["Username"];
      print(name);

      // User model method to fetch data
      userModelobj = UserModel(
          userName: snapshot["Username"],
          userEmail: snapshot["email"],
          mobNo: snapshot["email"],
          whastappNo: snapshot["email"]);
      // name = userModelobj!.userName;
      // print(name);
    }
  }

  //
  //
  //
  // UserModel? userModelobj; // created object of model class
  //
  String? type; //variable for direct getting
  //
  //function for fetch
  //
  fetchUsertype() async {
    // user details are fetched to variable as map form
    //
    DocumentReference<Map<String, dynamic>> currentUserDoc = db
        .collection("allCollection")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    //assigned fetching data to a variable
    //
    final snapshot = await currentUserDoc.get();
    //if condition to fetch data
    //
    if (snapshot.exists) {
      //normal method used to fetch dat to a variable declared before
      type = snapshot["Type"];
      print(type);
      return type;
    }
  }
}
