import 'package:flutter/material.dart';
import 'package:packie/constants.dart';

import './_all.dart';

class CheckLists extends StatelessWidget {
  const CheckLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 15),
          child: Container(
            height: 0.5,
            color: Constants.dividerColor,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return CheckListItem();
      },
    );
  }
}
