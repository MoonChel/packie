import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIcon extends StatelessWidget {
  CategoryIcon({
    Key key,
    this.size = 100,
    this.iconImage,
    this.onPressed,
    this.selected = false,
  }) : super(key: key);

  final String iconImage;
  final double size;
  final Function onPressed;
  final bool selected;

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Image.asset(iconImage),
        padding: EdgeInsets.all(su.setWidth(25)),
        height: su.setHeight(size),
        decoration: BoxDecoration(
          color: Constants.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border:
              selected ? Border.all(color: Constants.orange, width: 1) : null,
        ),
      ),
    );
  }
}
