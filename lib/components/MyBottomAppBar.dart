import 'package:app_review/app_review.dart';
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
      selectedItemColor: Constants.fontColor,
      currentIndex: 0,
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, PackingTipsPage.routeName);
        } else if (index == 1) {
          // in this case it's only for android
          AppReview.writeReview.then((onValue) {});
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline),
          title: Text("packing tips"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          title: Text("rate"),
        ),
      ],
    );
  }
}
