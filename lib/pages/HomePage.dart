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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: su.setHeight(150),
                  left: su.setWidth(Constants.bodyPadding),
                ),
                child: Icon(
                  Icons.supervised_user_circle,
                  size: 50,
                ),
              ),
              CornerButton(
                onPressed: () {
                  showCreateNewListModal(context);
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: su.setHeight(50),
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
          SizedBox(height: su.setHeight(200)),
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

  Future showCreateNewListModal(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final su = ScreenUtil.getInstance();

    final radius = BorderRadius.only(
      topLeft: Radius.circular(su.setWidth(100)),
      topRight: Radius.circular(su.setWidth(100)),
    );

    final iconSize = 80.0;

    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: radius),
      context: context,
      isScrollControlled: true,
      builder: (context) => ClipRRect(
        borderRadius: radius,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 0,
                child: CloseBottomSheetButton(),
              ),
              Padding(
                padding: EdgeInsets.all(su.setWidth(100)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Create Packing List",
                          style: textTheme.headline,
                        ),
                      ],
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
                        CategoryIcon(iconImage: 'assets/Group 12.png'),
                        CategoryIcon(iconImage: 'assets/clothes.png'),
                        CategoryIcon(iconImage: 'assets/camera.png'),
                        CategoryIcon(iconImage: 'assets/headphones.png'),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: su.setHeight(40),
                        ),
                        color: Constants.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Create List",
                          style: textTheme.title.copyWith(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
