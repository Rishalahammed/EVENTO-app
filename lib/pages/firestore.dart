import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  final db = FirebaseFirestore.instance;

  addUser(uid, email, username) async {
    final userCollection = db.collection("user");
    await userCollection.doc(uid).set({
      "Username": username,
      "email": email,
    });
  }

  addProduct(description, category, prize) async {
    final userCollection = db.collection("management");
    await userCollection.doc().set({
      // "Image": "",
      "Description": description,
      "Category": category,
      "Prize": prize,
    });
  }
}
