import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIcon extends StatefulWidget {
  CategoryIcon({
    Key key,
    this.size = 100,
    this.iconImage,
    this.onPressed,
  }) : super(key: key);

  final String iconImage;
  final double size;
  final Function onPressed;

  @override
  _CategoryIconState createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  final su = ScreenUtil.getInstance();

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;

          if (widget.onPressed != null) {
            widget.onPressed();
          }
        });
      },
      child: Container(
        child: Image.asset(widget.iconImage),
        padding: EdgeInsets.all(su.setWidth(25)),
        height: su.setHeight(widget.size),
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
