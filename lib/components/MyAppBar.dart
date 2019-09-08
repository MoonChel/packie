import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({
    Key key,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Constants.backArrorColor,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
