import 'package:flutter/material.dart';

import 'package:packie/constants.dart';
import 'package:packie/pages/_all.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // remove title from icons
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 200,
      iconSize: 35,
      unselectedItemColor: Constants.fontColor,
      selectedItemColor: Constants.orange,
      onTap: (int index) {
        if (index == 1) {
          Navigator.pushNamed(context, PackingTipsPage.routeName);
        } else if (index == 2) {
          Navigator.pushNamed(context, SettingsPage.routeName);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("test"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
          title: Text("test"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("test"),
        ),
      ],
    );
  }
}
