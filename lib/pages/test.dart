import 'package:evento/pages/firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  FireStore firestore = FireStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
          ),

          ElevatedButton(
              onPressed: () {
                firestore.fetchCurrentUser();
              },
              child: Text("get")) // Expanded(
          //   child: FutureBuilder(
          //     future: FirebaseFirestore.instance.collection("user").get(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(
          //           itemCount: snapshot.data!.docs.length,
          //           itemBuilder: (context, index) {
          //             final DocumentSnapshot userSnap =
          //                 snapshot.data!.docs[index];
          //             return Text(userSnap["Username"]);
          //           },
          //         );
          //       }
          //       return Text("Its Error");
          //     },
          //   ),
          // ),
          // Expanded(
          //   child: FutureBuilder(
          //     future: FirebaseFirestore.instance
          //         .collection("management")
          //         .doc(emp)
          //         .collection("products")
          //         .get(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(
          //           itemCount: snapshot.data!.docs.length,
          //           itemBuilder: (context, index) {
          //             final DocumentSnapshot userSnap =
          //                 snapshot.data!.docs[index];
          //             return Text(userSnap["Company name"]);
          //           },
          //         );
          //       }
          //       return Text("Its Error");
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

//   function(context, snapshot) {
//     FutureBuilder(
//       future: FirebaseFirestore.instance.collection("user").get(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final DocumentSnapshot userSnap =
//               snapshot.data!.docs[index];
//               return Text(userSnap["Username"]);
//             },
//           );
//         }
//         return Text("Its Error");
//       },
//     ),
}
