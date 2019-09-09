import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/components/_all.dart';

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
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyBackButton(topPadding: 0.0),
                Padding(
                  padding: EdgeInsets.only(right: su.setHeight(15)),
                  child: FlatButton(
                    child: Image.asset('assets/images/settings_white.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsPage.routeName);
                    },
                  ),
                ),
              ],
            ),
            titleSpacing: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/clothes-luggage.jpg',
                fit: BoxFit.fill,
              ),
              centerTitle: false,
              title: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Packing Tips",
                          style: textTheme.headline.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(text: "\n"),
                        TextSpan(
                          text: "The ultimate guide to Smart Packing",
                          style: textTheme.body1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              titlePadding: EdgeInsets.only(
                left: su.setWidth(Constants.bodyPadding),
                bottom: su.setWidth(Constants.bodyPadding) / 2,
              ),
            ),
            expandedHeight: expHeight,
            bottom: PreferredSize(
              preferredSize: Size(0, su.setHeight(250.0)),
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
