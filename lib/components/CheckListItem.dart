import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:packie/pages/ChecklistDetailsPage.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import './_all.dart';

class CheckListItem extends StatelessWidget {
  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ChecklistDetailsPage.routeName);
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Bahamas Packing List", style: textTheme.title),
              Row(
                children: <Widget>[
                  CategoryIcon(iconImage: 'assets/clothes.png'),
                  SizedBox(width: 5),
                  CategoryIcon(iconImage: 'assets/clothes.png'),
                ],
              )
            ],
          ),
          SizedBox(height: su.setHeight(60)),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: 0.5,
              // valueColor: Constants.orange,
              backgroundColor: Constants.progressIndicatorBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
