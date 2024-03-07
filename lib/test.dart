import 'package:flutter/material.dart';

class Testp extends StatefulWidget {
  const Testp({super.key});

  @override
  State<Testp> createState() => _TestpState();
}

class _TestpState extends State<Testp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ElevatedButton(onPressed: () {}, child: Text("touch"))],
        ),
      ),
    );
  }
}
