import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:packie/pages/ChecklistDetailsPage.dart';

import './_all.dart';

class CheckListItem extends StatelessWidget {
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
                  CategoryIcon(),
                  SizedBox(width: 5),
                  CategoryIcon(),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: 0.5,
            // valueColor: ,
            backgroundColor: Constants.progressIndicatorBackgroundColor,
          ),
        ],
      ),
    );
  }
}
