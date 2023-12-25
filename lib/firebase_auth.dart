import 'package:evento/pages/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_0/pages/firestore.dart';

final auth = FirebaseAuth.instance;
//
FireStore obj = FireStore();
//
//
//
signup(emailAddress, password, name) async {
  try {
    final credential = await auth
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        // final email = credential.user!.email;
        // final uid = credential.user!.uid;
        .then((value) {
      return obj.addUser(
        value.user!.uid,
        emailAddress,
        name,
      );
    });
  } catch (e) {
    print(e);
  }
}

//
//
//
//
//
login(email, password) async {
  try {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.sendEmailVerification();
  } catch (e) {
    print(e);
  }
}
