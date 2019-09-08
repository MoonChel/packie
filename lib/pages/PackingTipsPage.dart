import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/constants.dart';
import 'package:packie/pages/_all.dart';

class PackingTipsPage extends StatelessWidget {
  static const routeName = '/PackingTipsPage';

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final expHeight = su.setHeight(700);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Open settings',
                onPressed: () {
                  Navigator.pushNamed(context, SettingsPage.routeName);
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Packing Tips", style: textTheme.headline),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: "The ultimate guide to Smart Packing",
                      style: textTheme.subtitle,
                    ),
                  ],
                ),
              ),
              titlePadding: EdgeInsets.only(
                left: su.setWidth(Constants.bodyPadding),
                bottom: su.setWidth(Constants.bodyPadding) / 2,
              ),
            ),
            expandedHeight: expHeight,
            bottom: PreferredSize(
              preferredSize: Size(0, su.setHeight(200.0)),
              child: Container(),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(Constants.bodyPadding),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                  Container(height: 100, color: Colors.tealAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
