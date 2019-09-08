import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './_all.dart';

class CheckLists extends StatelessWidget {
  CheckLists({
    Key key,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            top: su.setHeight(120),
            bottom: su.setHeight(80),
            left: su.setHeight(50),
            right: su.setHeight(50),
          ),
          child: Container(
            height: 0.5,
            color: Constants.dividerColor,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: su.setHeight(Constants.bodyPadding),
          ),
          child: CheckListItem(),
        );
      },
    );
  }
}
