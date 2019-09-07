import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CornerButton extends StatelessWidget {
  CornerButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  static const borderRadius = 20.0;

  final Function onPressed;

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    double height = su.setHeight(320);
    double width = su.setWidth(200);
    double iconSize = su.setSp(120);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Constants.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
          ),
        ),
        height: height,
        width: width,
        child: Align(
          alignment: Alignment(0.1, 0.5),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
