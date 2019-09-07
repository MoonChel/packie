import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIcon extends StatelessWidget {
  CategoryIcon({
    Key key,
    this.size,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();
  final double size;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Icon(
            Icons.phone_android,
            size: size ?? su.setWidth(60),
          ),
          padding: EdgeInsets.all(su.setWidth(20)),
          decoration: BoxDecoration(
            color: Constants.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
