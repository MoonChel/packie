import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import './_all.dart';

Future showMyBottomSheetModal({
  BuildContext context,
  List<Widget> children,
}) {
  final su = ScreenUtil.getInstance();

  final radius = BorderRadius.only(
    topLeft: Radius.circular(su.setWidth(100)),
    topRight: Radius.circular(su.setWidth(100)),
  );

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: radius),
    builder: (context) => ClipRRect(
      borderRadius: radius,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              child: CloseBottomSheetButton(),
            ),
            Padding(
              padding: EdgeInsets.all(su.setWidth(100)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
