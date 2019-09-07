import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/constants.dart';

class CloseBottomSheetButton extends StatelessWidget {
  CloseBottomSheetButton({
    Key key,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: su.setHeight(200),
        width: su.setWidth(200),
        decoration: BoxDecoration(
          color: Constants.orange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: su.setSp(100),
          ),
        ),
      ),
    );
  }
}
