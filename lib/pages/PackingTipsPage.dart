import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:packie/components/_all.dart';

import 'package:packie/constants.dart';
import 'package:packie/models.dart';

import 'package:packie/dummy_data.dart';

class PackingTipsPage extends StatelessWidget {
  static const routeName = '/PackingTipsPage';

  final su = ScreenUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(context),
          buildSliverList(context),
        ],
      ),
    );
  }

  SliverList buildSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        tips
            .asMap()
            .map(
              (index, packingTip) => MapEntry(
                index,
                buildPackingTipListItem(
                  index,
                  packingTip,
                  context,
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  Widget buildPackingTipListItem(
    int index,
    PackingTip packingTip,
    BuildContext context,
  ) {
    final textTheme = Theme.of(context).textTheme;

    final contentPadding = su.setHeight(80);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(contentPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(su.setWidth(100)),
                ),
              ),
              title: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: contentPadding),
                    child: Text(packingTip.title),
                  ),
                  ClipRRect(
                    child: CloseBottomSheetButton(),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(su.setWidth(100)),
                    ),
                  ),
                ],
              ),
              content: Text(packingTip.description),
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          index != 0
              ? MyDivider(paddingTop: 80, paddingBottom: 60)
              : SizedBox(height: su.setHeight(100)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(Constants.bodyPadding),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: packingTip.title, style: textTheme.title),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: packingTip.description.substring(0, 45) + ' ...',
                    style: textTheme.subtitle,
                  ),
                ],
              ),
            ),
          ),
          if (index == tips.length - 1) SizedBox(height: su.setHeight(100))
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final expHeight = su.setHeight(700);

    return SliverAppBar(
      backgroundColor: Constants.blue,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      title: MyBackButton(topPadding: 0.0, color: Colors.white),
      // prepared for setting page
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      // MyBackButton(topPadding: 0.0, color: Colors.white),
      // Padding(
      //   padding: EdgeInsets.only(
      //     top: su.setHeight(10),
      //     right: su.setHeight(10),
      //   ),
      //   child: FlatButton(
      //     child: Image.asset('assets/images/settings_white.png'),
      //     onPressed: () {
      //       Navigator.pushNamed(context, SettingsPage.routeName);
      //     },
      //   ),
      // ),
      //   ],
      // ),
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
        preferredSize: Size(0, su.setHeight(200.0)),
        child: Container(),
      ),
      pinned: true,
    );
  }
}
