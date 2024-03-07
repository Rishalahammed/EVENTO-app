import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/model/addTolistModel.dart';
import 'package:evento/model/allusermodel.dart';
import 'package:evento/model/vendor_reg_model.dart';
import 'package:evento/model/managementmodel.dart';
import 'package:evento/model/productmodel.dart';
import 'package:evento/model/productsellermodel.dart';
import 'package:evento/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStore with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  //
  //
  //
  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //********************* adding user details *********************
  Future addUserdetails(uid, UserModel usermodel) async {
    final userCollection = db.collection("user").doc(uid);
    await userCollection.set(usermodel.toMap(uid));
  }

  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //***************** adding management vendor details **********************
  // Future addmanagement(uid, ManagementModel managementModel) async {
  //   final vendorCollection = db.collection("management");
  //   await vendorCollection.doc(uid).set(managementModel.toMap(uid));
  // }

  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //**************** adding productseller vendor details *********************
  // Future addproductseller(uid, ProductsellerModel productsellerModel) async {
  //   final vendorCollection = db.collection("productseller");
  //   await vendorCollection.doc(uid).set(productsellerModel.toMap(uid));
  // }

  ////////////////////////////////////////////////////////////////////////////
  //
  //
  //***************** adding foodcaterer vendor details **********************
  Future addNewVandor(uid, VendorRegModel foodcatererModel) async {
    final vendorCollection = db.collection("All-Vendor");
    await vendorCollection.doc(uid).set(foodcatererModel.toMap(uid));
  }

  /////////////////////////////////////////////////////////////////////////////////
  //
  //
  //*********** adding types of all users and vendors to one collection ***********
  Future addtoall(uid, AllUserModel allUserModel) async {
    final userCollection = db.collection("allCollection");
    await userCollection.doc(uid).set(allUserModel.toJson(uid));
  }

  ///////////////////////////////////////////////////////////////////////////
  //
  //
  //******************* adding product details of vendor *******************
  Future addProduct(uid, ProductModel prModel) async {
    final product = db.collection("Products").doc();

    await product.set(prModel.toMap(product.id));
  }

  List<ProductModel> currentVendorproductList = [];
  fetchAllProductVendorAdded() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Products")
        .where("vendorId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    currentVendorproductList = snapshot.docs.map((e) {
      return ProductModel.fromMap(e.data());
    }).toList();
  }

  List<ProductModel> productsortedbyVendorTypeList = [];
  fetchProductByVendorType(vendortype) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Products")
        .where("vendorType", isEqualTo: vendortype)
        .get();

    productsortedbyVendorTypeList = snapshot.docs.map((e) {
      return ProductModel.fromMap(e.data());
    }).toList();
  }

  //////////////////////////////////////------------seraching
  List<ProductModel> allProductList = [];
  List<ProductModel> display_list = [];
  fetchAllProductForSearch() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Products").get();

    allProductList = snapshot.docs.map((e) {
      return ProductModel.fromMap(e.data());
    }).toList();
    notifyListeners();
  }

  void updateList(String value) {
    display_list = List.from(allProductList);
    display_list = allProductList
        .where((element) => element.product_category
            .toLowerCase()
            .contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  addToList(AddToListModel addToListModel, proID, ventorId) async {
    print(proID);
    print(ventorId);
    final doc = db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("List")
        .doc();
    await doc.set(addToListModel.toJson(doc.id, proID, ventorId));
  }

  double total_amt = 0;
  List<AddToListModel> producList = [];
  fetchAllLIst() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("List")
        .get();
    producList = snapshot.docs.map((e) {
      return AddToListModel.fromJson(e.data());
    }).toList();
  }

  calculateTotal(List<AddToListModel> lists) {
    print("C A L C U L A T I N G");
    total_amt = 0;
    for (var i in lists) {
      print(i.productModel.product_prize.toDouble());
      total_amt += i.productModel.product_prize.toDouble();
    }
    print("n");
  }

  removeFromList(docId, List<AddToListModel> lists) {
    db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("List")
        .doc(docId)
        .delete();

    calculateTotal(lists);
    notifyListeners();
  }
  //////////////////////--------------------------------------------------------
  //
  //
  //
  //

  //
  //
  //
  //
  // addproduct() async {
  //   final doc = db
  //       .collection("vendor")
  //       .doc()
  //       .collection("Management")
  //       .doc("UID")
  //       .collection("produ")
  //       .doc();
  //   doc.set({"id": doc.id});
  // }

  // delete(docid) {
  //   db
  //       .collection("vendor")
  //       .doc()
  //       .collection("Management")
  //       .doc("UID")
  //       .collection("produ")
  //       .doc(docid)
  //       .delete();
  // }

//   List<UserModel> allUsers = [];
//   UserModel? usermodel;
//
//   fetchDatafromStore() async {
//     QuerySnapshot querySnapshot = await db
//         .collection("vendor")
//         .doc()
//         .collection("Management")
//         .doc("UID")
//         .collection("produ")
//         .get();
//
//     allUsers = querySnapshot.docs.map((e) {
//       return UserModel.fromMap(e.data() as Map<String, dynamic>);
//     }).toList();
//
// ///////////////////////////////////////////////////////////////////////////////
//     final docSnapshot = await db
//         .collection("vendor")
//         .doc()
//         .collection("Management")
//         .doc("UID")
//         .collection("produ")
//         .doc()
//         .get();
//
//     usermodel = UserModel.fromMap(docSnapshot.data()!);
//   }
//
// //////////////////////////FETCH EX////////////////////////////////////
// //////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////////////////
//
//   exxModel? userModelobj; // created object of model class
//   //
//   String name = ""; //variable for direct getting
//   //
//   //function for fetch
//   //
//   fetchCurrentUser() async {
//     print("First");
//     // user details are fetched to variable as map form
//     //
//     DocumentReference<Map<String, dynamic>> currentUserDoc =
//         db.collection("user").doc(FirebaseAuth.instance.currentUser!.uid);
//     //assigned fetching data to a variable
//     //
//     final snapshot = await currentUserDoc.get();
//     //if condition to fetch data
//     //
//     if (snapshot.exists) {
//       print("object");
//       //normal method used to fetch dat to a variable declared before
//       name = snapshot["Username"];
//       print(name);
//
//       // User model method to fetch data
//       userModelobj = exxModel(
//           userName: snapshot["Username"],
//           userEmail: snapshot["email"],
//           mobNo: snapshot["email"],
//           whastappNo: snapshot["email"]);
//       // name = userModelobj!.userName;
//       // print(name);
//     }
//   }
//
//   //
//   //
//   //
//   // UserModel? userModelobj; // created object of model class
//   //
//   String? type; //variable for direct getting
//   //
//   //function for fetch
//   //
//   fetchUsertype() async {
//     // user details are fetched to variable as map form
//     //
//     DocumentReference<Map<String, dynamic>> currentUserDoc = db
//         .collection("allCollection")
//         .doc(FirebaseAuth.instance.currentUser!.uid);
//     //assigned fetching data to a variable
//     //
//     final snapshot = await currentUserDoc.get();
//     //if condition to fetch data
//     //
//     if (snapshot.exists) {
//       //normal method used to fetch dat to a variable declared before
//       type = snapshot["Type"];
//       print(type);
//       return type;
//     }
//   }
  AllUserModel? allUserModel;
  Future<AllUserModel?> fetchAllUserForLogintype(currentUserId) async {
    DocumentSnapshot<Map<String, dynamic>> loginuserDoc =
        await db.collection("allCollection").doc(currentUserId).get();
    if (loginuserDoc.exists) {
      allUserModel = AllUserModel.fromJson(loginuserDoc.data()!);
    }
    return allUserModel;
  }

  AllUserModel? currentUserModel;
  Future<AllUserModel> fetchCurrentUserData(docID) async {
    DocumentSnapshot<Map<String, dynamic>> snpshot =
        await db.collection("allCollection").doc(docID).get();
    if (snpshot.exists) {
      currentUserModel = AllUserModel.fromJson(snpshot.data()!);
      print(currentUserModel!.email);
    }
    return currentUserModel!;
  }

  UserModel? currentUserDetailModel;
  VendorRegModel? currentvendorModel;
  fetchCurrentUserDetailData(
    collection,
    uid,
  ) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection(collection).doc(uid).get();
    if (snapshot.exists) {
      if (collection == "user") {
        currentUserDetailModel = UserModel.fromMap(snapshot.data()!);
      } else if (collection == "All-Vendor") {
        currentvendorModel = VendorRegModel.fromMap(snapshot.data()!);
      }
    }
  }

  editUserName(newName) {
    db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"Username": newName});
  }

  editVendordetail(field, newData) {
    db
        .collection("All-Vendor")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({field: newData});
    notifyListeners();
  }

  VendorRegModel? selectedVendor;
  fetchSelectedVendorById(id) async {
    DocumentSnapshot<Map<String, dynamic>> docs =
        await db.collection("All-Vendor").doc(id).get();
    if (docs.exists) {
      selectedVendor = VendorRegModel.fromMap(docs.data()!);
    }
  }
}
