import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class MyBackButton extends StatelessWidget {
  MyBackButton({
    Key key,
    this.topPadding = Constants.bodyPadding,
    this.color = Constants.orange,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();
  final double topPadding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    IconData icon =
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios;

    return Padding(
      padding: EdgeInsets.only(
        top: su.setHeight(this.topPadding),
        left: su.setWidth(Constants.bodyPadding - 10),
      ),
      child: GestureDetector(
        onTap: () {
          FlutterStatusbarcolor.setStatusBarColor(
            Constants.blue,
            animate: true,
          );
          Navigator.of(context).pop();
        },
        child: Icon(
          icon,
          size: su.setHeight(80),
          color: color,
        ),
      ),
    );
  }
}
