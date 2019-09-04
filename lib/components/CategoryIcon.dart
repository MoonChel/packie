import 'package:flutter/material.dart';
import 'package:packie/constants.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.phone_android),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Constants.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
