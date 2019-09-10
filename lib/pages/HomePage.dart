import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packie/pages/ChecklistDetailsPage.dart';
import 'package:provider/provider.dart';

import 'package:packie/constants.dart';
import 'package:packie/components/_all.dart';
import 'package:packie/store.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // init sizes singelton
    ScreenUtil.instance = ScreenUtil(width: 1125, height: 2436)..init(context);
    final su = ScreenUtil.getInstance();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(su.setHeight(240)),
        child: buildAppBar(su, context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(su, textTheme),
          SizedBox(height: su.setHeight(150)),
          Expanded(child: CheckLists()),
          SizedBox(height: su.setHeight(100)),
        ],
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }

  AppBar buildAppBar(ScreenUtil su, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: su.setHeight(150),
                left: su.setWidth(Constants.bodyPadding),
              ),
              child: Image.asset('assets/images/Avatar.png'),
            ),
            CornerButton(
              onPressed: () {
                showCreateCheckListModal(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildHeader(ScreenUtil su, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(
        top: su.setHeight(40),
        left: su.setWidth(Constants.bodyPadding),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Hello, ",
              style: textTheme.headline.copyWith(color: Constants.orange),
            ),
            TextSpan(
              text: "Let's start packing!",
              style: textTheme.headline,
            ),
            TextSpan(text: "\n"),
            TextSpan(
              text: "It takes only a few minutes...",
              style: textTheme.title,
            ),
          ],
        ),
      ),
    );
  }

  Future showCreateCheckListModal(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final su = ScreenUtil.getInstance();
    final textController = TextEditingController();
    final storeProvider = Provider.of<StoreProvider>(context);

    var selectedCategories = [];

    return showMyBottomSheetModal(
      context: context,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Create Packing List", style: textTheme.headline),
        ),
        SizedBox(height: su.setHeight(50)),
        Flexible(
          child: TextField(
            controller: textController,
            maxLines: 1,
            maxLength: 50,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "List Name",
              errorText: textController.text.isNotEmpty
                  ? "Please fill checklist name"
                  : null,
            ),
          ),
        ),
        SizedBox(height: su.setHeight(50)),
        GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: storeProvider.defaultCheckList
                .groupByCategory()
                .keys
                .map((category) => CategoryIcon(
                      iconImage: category.iconPath,
                      onPressed: () {
                        if (selectedCategories.contains(category)) {
                          selectedCategories.remove(category);
                        } else {
                          selectedCategories.add(category);
                        }
                      },
                    ))
                .toList()),
        SizedBox(height: su.setHeight(40)),
        MyRaisedButton(
          color: Constants.blue,
          text: "Create List",
          onPressed: () {
            Navigator.of(context).pop();
            storeProvider.createCheckList(
              textController.text,
              selectedCategories,
            );
            Navigator.of(context).pushNamed(ChecklistDetailsPage.routeName);
          },
        ),
      ],
    );
  }
}
