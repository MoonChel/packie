import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/store.dart';
import 'package:packie/constants.dart';
import 'package:packie/pages/_all.dart';
import 'package:packie/components/_all.dart';

class CheckListsWidget extends StatelessWidget {
  CheckListsWidget({
    Key key,
  }) : super(key: key);

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreProvider>(context);

    return FutureBuilder(
      future: store.loadMyCheckLists(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        if (store.myCheckLists.length == 0) {
          return Center(child: Image.asset('assets/images/66.jpg'));
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: store.myCheckLists.length,
          separatorBuilder: (BuildContext context, int index) {
            return MyDivider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(store.myCheckLists[index].id.toString()),
              onDismissed: (direction) {
                store.removeCheckList(store.myCheckLists[index]);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: su.setWidth(Constants.bodyPadding),
                ),
                child: CheckListItemWidget(
                  checkList: store.myCheckLists[index],
                  onPressed: () {
                    store.currentCheckList = store.myCheckLists[index];
                    Navigator.of(context)
                        .pushNamed(ChecklistDetailsPage.routeName);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
