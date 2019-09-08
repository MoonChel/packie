import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIcon extends StatelessWidget {
  CategoryIcon({
    Key key,
    this.size = 100,
    this.iconImage,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();
  final String iconImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Image.asset(iconImage),
          padding: EdgeInsets.all(su.setWidth(25)),
          height: su.setHeight(size),
          decoration: BoxDecoration(
            color: Constants.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
