import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:evento/pages/user_pages/search_page.dart';
import 'package:evento/pages/user_pages/userprofile_page.dart';
import 'package:flutter/material.dart';

import 'user_pages/home_page.dart';
import 'user_pages/list_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //
  //
  //
  //
  //****************Pages are listed************
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const ListPage(),
    const ProfilePage(),
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
              iconData: Icons.add_chart_rounded,
              label: 'List',
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
