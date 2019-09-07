import 'package:flutter/material.dart';
import 'package:packie/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: Constants.backArrorColor),
    );
  }
}
