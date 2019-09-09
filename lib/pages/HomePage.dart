import 'package:flutter/material.dart';
import 'package:packie/components/_all.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packie/constants.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // init sizes singelton
    ScreenUtil.instance = ScreenUtil(width: 1125, height: 2436)..init(context);
    final su = ScreenUtil.getInstance();

    return Scaffold(
      backgroundColor: Colors.white,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: su.setHeight(150),
                    left: su.setWidth(Constants.bodyPadding / 2),
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
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: su.setHeight(40),
              left: su.setHeight(Constants.bodyPadding),
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
          ),
          SizedBox(height: su.setHeight(150)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: CheckLists()),
              ],
            ),
          ),
          SizedBox(height: su.setHeight(100)),
        ],
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }

  Future showCreateCheckListModal(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final su = ScreenUtil.getInstance();

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
            maxLines: 1,
            maxLength: 50,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "List Name",
            ),
          ),
        ),
        SizedBox(height: su.setHeight(50)),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          children: <Widget>[
            CategoryIcon(iconImage: 'assets/images/Group 12.png'),
            CategoryIcon(iconImage: 'assets/images/clothes.png'),
            CategoryIcon(iconImage: 'assets/images/camera.png'),
            CategoryIcon(iconImage: 'assets/images/headphones.png'),
          ],
        ),
        SizedBox(height: su.setHeight(30)),
        MyRaisedButton(
          color: Constants.blue,
          text: "Create List",
          onPressed: () {},
        ),
      ],
    );
  }
}
