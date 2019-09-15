import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/constants.dart';
import 'package:packie/models.dart';

import './_all.dart';

class CheckListItemWidget extends StatelessWidget {
  CheckListItemWidget({this.checkList, this.onPressed});

  final su = ScreenUtil.getInstance();
  final CheckList checkList;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(checkList.name, style: textTheme.title),
              Row(
                children: checkList.categories
                    .map(
                      (category) => Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: CategoryIcon(
                          iconImage: category.iconPath,
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
          SizedBox(height: su.setHeight(40)),
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
