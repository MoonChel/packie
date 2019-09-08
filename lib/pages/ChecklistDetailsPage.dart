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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyAppBar(),
              CornerButton(
                onPressed: () {
                  showCreateNewListModal(context);
                },
              ),
            ],
          ),
          Expanded(
            child: MyPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bahamas Packing List", style: textTheme.headline),
                  buildCategoriesView(),
                  Expanded(child: buildCheckListItems()),
                  SizedBox(height: su.setHeight(60)),
                  SizedBox(
                    width: double.infinity,
                    child: buildClearButton(textTheme),
                  ),
                  SizedBox(height: su.setHeight(80))
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
      padding: EdgeInsets.zero,
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
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Clear",
        style: textTheme.title.copyWith(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {},
    );
  }

  Widget buildCategoriesView() {
    final su = ScreenUtil.getInstance();
    final iconSize = su.setWidth(80);

    return GridView.count(
      padding: EdgeInsets.only(
        top: su.setHeight(50),
        bottom: su.setHeight(30),
      ),
      crossAxisCount: 4,
      crossAxisSpacing: 15,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        CategoryIcon(
          iconImage: 'assets/Group 12.png',
          size: iconSize,
        ),
        CategoryIcon(
          iconImage: 'assets/clothes.png',
          size: iconSize,
        ),
        CategoryIcon(
          iconImage: 'assets/camera.png',
          size: iconSize,
        ),
        CategoryIcon(
          iconImage: 'assets/headphones.png',
          size: iconSize,
        ),
      ],
    );
  }
}

void showCreateNewListModal(BuildContext context) {}
