import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/constants.dart';

class MyDivider extends StatelessWidget {
  MyDivider({
    Key key,
    this.paddingTop = 120,
    this.paddingBottom = 80,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: su.setHeight(paddingTop),
        bottom: su.setHeight(paddingBottom),
        left: su.setHeight(50),
        right: su.setHeight(50),
      ),
      child: Container(
        height: 0.5,
        color: Constants.dividerColor,
      ),
    );
  }
}
