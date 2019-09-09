import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packie/models.dart';
import 'package:provider/provider.dart';

import 'package:packie/components/_all.dart';
import 'package:packie/constants.dart';
import 'package:packie/store.dart';

class ChecklistDetailsPage extends StatefulWidget {
  static const routeName = '/ChecklistDetailsPage';

  @override
  _ChecklistDetailsPageState createState() => _ChecklistDetailsPageState();
}

class _ChecklistDetailsPageState extends State<ChecklistDetailsPage> {
  final su = ScreenUtil.getInstance();

  CheckListCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final storeProvider = Provider.of<StoreProvider>(context);
    final currentCheckList = storeProvider.currentCheckList;
    final currentCheckListGrouped = currentCheckList.groupByCategory();

    if (mounted) {
      setState(() {
        selectedCategory = currentCheckListGrouped.keys.first;
      });
    }

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
            Text(currentCheckList.name, style: textTheme.headline),
            buildCategoriesView(currentCheckListGrouped.keys.toList()),
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

  Widget buildCategoriesView(List<CheckListCategory> categories) {
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
      children: categories
          .map(
            (category) => CategoryIcon(
              iconImage: category.iconPath,
            ),
          )
          .toList(),
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
