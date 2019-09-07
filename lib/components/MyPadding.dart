import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPadding extends StatelessWidget {
  MyPadding({this.child});

  final su = ScreenUtil.getInstance();
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: su.setWidth(Constants.bodyPadding),
        right: su.setWidth(Constants.bodyPadding),
        top: su.setWidth(Constants.bodyPadding),
      ),
      child: child,
    );
  }
}
