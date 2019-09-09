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
        return MyDivider();
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
