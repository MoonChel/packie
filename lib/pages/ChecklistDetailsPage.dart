import 'package:flutter/material.dart';

import 'package:packie/components/_all.dart';
import 'package:packie/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChecklistDetailsPage extends StatelessWidget {
  static const routeName = '/ChecklistDetailsPage';

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyAppBar(),
          Positioned(
            right: 0,
            child: CornerButton(
              onPressed: () {
                showCreateNewListModal(context);
              },
            ),
          ),
          SafeArea(
            child: MyPadding(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: su.setHeight(100)),
                  Text("Bahamas Packing List", style: textTheme.headline),
                  SizedBox(height: su.setHeight(50)),
                  buildCategoriesView(),
                  SizedBox(height: su.setHeight(50)),
                  Expanded(child: buildCheckListItems()),
                  SizedBox(height: su.setHeight(50)),
                  SizedBox(
                    width: double.infinity,
                    child: buildClearButton(textTheme),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildCheckListItems() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 15,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool value) {},
                ),
                SizedBox(width: 10),
                Expanded(child: Text("T-short")),
                Icon(Icons.more_vert, color: Constants.blue),
              ],
            ),
            decoration: BoxDecoration(
              color: Constants.backgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
    );
  }

  RaisedButton buildClearButton(TextTheme textTheme) {
    return RaisedButton(
      color: Constants.orange,
      child: Text(
        "Clear",
        style: textTheme.button.copyWith(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {},
    );
  }

  GridView buildCategoriesView() {
    final su = ScreenUtil.getInstance();
    final iconSize = su.setWidth(100);

    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: <Widget>[
        CategoryIcon(size: iconSize),
        CategoryIcon(size: iconSize),
        CategoryIcon(size: iconSize),
        CategoryIcon(size: iconSize),
      ],
    );
  }
}

void showCreateNewListModal(BuildContext context) {}
