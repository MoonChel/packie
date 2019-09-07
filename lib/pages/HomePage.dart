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
      body: Stack(
        children: <Widget>[
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.supervised_user_circle, size: 50),
                  SizedBox(height: 20),
                  Text(
                    "Hello, Let's start packing!",
                    style: textTheme.headline,
                  ),
                  Text(
                    "It takes only a few minutes...",
                    style: textTheme.title,
                  ),
                  SizedBox(height: 50),
                  Expanded(
                    child: CheckLists(),
                  ),
                ],
              ),
            ),
          ),
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

    final iconSize = su.setWidth(100);

    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: radius),
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: radius,
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
                        border: null,
                        hintText: "List Name",
                        focusedBorder: null,
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
                      CategoryIcon(size: iconSize),
                      CategoryIcon(size: iconSize),
                      CategoryIcon(size: iconSize),
                      CategoryIcon(size: iconSize),
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
    );
  }
}
