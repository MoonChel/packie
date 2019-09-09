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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(su.setHeight(240)),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: null,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyBackButton(),
                CornerButton(
                  onPressed: () {
                    showCreateNewListModal(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: su.setWidth(Constants.bodyPadding),
          right: su.setWidth(Constants.bodyPadding),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Bahamas Packing List", style: textTheme.headline),
            buildCategoriesView(),
            Expanded(child: buildCheckListItems()),
            SizedBox(height: su.setHeight(60)),
            MyRaisedButton(
              color: Constants.orange,
              text: "Clear",
              onPressed: () {},
            ),
            SizedBox(height: su.setHeight(80)),
          ],
        ),
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

  Widget buildCategoriesView() {
    final su = ScreenUtil.getInstance();

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
        CategoryIcon(iconImage: 'assets/images/Group 12.png'),
        CategoryIcon(iconImage: 'assets/images/clothes.png'),
        CategoryIcon(iconImage: 'assets/images/camera.png'),
        CategoryIcon(iconImage: 'assets/images/headphones.png'),
      ],
    );
  }
}

Future showCreateNewListModal(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  final su = ScreenUtil.getInstance();

  return showMyBottomSheetModal(context: context, children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Text("Add New Item", style: textTheme.headline),
    ),
    SizedBox(height: su.setHeight(50)),
    Flexible(
      child: TextField(
        maxLines: 1,
        maxLength: 50,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "List Name",
        ),
      ),
    ),
    SizedBox(height: su.setHeight(30)),
    MyRaisedButton(
      text: "Add Item",
      onPressed: () {},
    ),
  ]);
}
