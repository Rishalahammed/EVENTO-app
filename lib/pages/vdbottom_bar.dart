import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:evento/pages/vendor_pages/vendorhome_page.dart';
import 'package:evento/pages/vendor_pages/vendorprofile_page.dart';
import 'package:evento/pages/vendor_pages/vendorsearch_page.dart';
import 'package:flutter/material.dart';
// import 'package:project_0/pages/vendor_pages/vendorhome_page.dart';
// import 'package:project_0/pages/vendor_pages/vendorprofile_page.dart';
// import 'package:project_0/pages/vendor_pages/vendorsearch_page.dart';

class BottomBarvd extends StatefulWidget {
  const BottomBarvd({super.key});

  @override
  State<BottomBarvd> createState() => _BottomBarvdState();
}

class _BottomBarvdState extends State<BottomBarvd> {
  //
  //
  //
  //
  //****************Pages are listed************
  List<Widget> pages = [
    const VendordhomePage(),
    const VendorsearchPage(),
    const VendorprofilePage(),
  ];
  //
  //
  //
  //***************Current index is assigned to 0*************
  int currrentindex = 0;
  //
  //
  //
  //************Current index assigned with newindex**********

  updateindex(int newindex) {
    setState(() {
      currrentindex = newindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currrentindex],
      bottomNavigationBar: BottomBarBubble(
        selectedIndex: currrentindex,
        items: [
          BottomBarItem(
              iconData: Icons.home,
              label: 'Home',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          BottomBarItem(
              iconData: Icons.search,
              label: 'Search',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          BottomBarItem(
              iconData: Icons.account_circle,
              label: 'Profile',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
        ],
        //
        //
        //
        //**********onSelect function of navbar***********
        onSelect: (index) {
          updateindex(index);
        },
      ),
    );
  }
}
