import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/store.dart';
import 'package:packie/constants.dart';
import 'package:packie/pages/_all.dart';
import 'package:packie/components/_all.dart';

class CheckLists extends StatelessWidget {
  CheckLists({
    Key key,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    var storeProvider = Provider.of<StoreProvider>(context);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: storeProvider.myCheckLists.length,
      separatorBuilder: (BuildContext context, int index) {
        return MyDivider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: su.setWidth(Constants.bodyPadding),
          ),
          child: CheckListItemWidget(
            checkList: storeProvider.myCheckLists[index],
            onPressed: () {
              storeProvider.currentCheckList =
                  storeProvider.myCheckLists[index];
              Navigator.of(context).pushNamed(ChecklistDetailsPage.routeName);
            },
          ),
        );
      },
    );
  }
}
