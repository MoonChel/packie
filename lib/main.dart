import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:packie/constants.dart';
import 'package:packie/pages/_all.dart';
import 'package:packie/pages/_routes.dart';
import 'package:packie/store.dart';
import 'package:packie/models.dart';

import 'package:packie/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    FlutterStatusbarcolor.setStatusBarColor(
      Constants.blue,
      animate: true,
    );

    return ChangeNotifierProvider(
      builder: (context) => StoreProvider(
        myCheckLists: [myCheckList],
        defaultCheckList: CheckList(
          name: "Default checklist",
          categories: [
            clothesCategory,
            toiletriesCategory,
            miscCategory,
            carryOnCategory,
          ],
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0.0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            buttonColor: Constants.blue,
            textTheme: ButtonTextTheme.primary,
          ),
          fontFamily: 'Nunito_Sans',
          textTheme: textTheme.copyWith(
            button: textTheme.button.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            headline: textTheme.headline.copyWith(
              color: Constants.fontColor,
              fontWeight: FontWeight.w800,
            ),
            title: textTheme.title.copyWith(
              color: Constants.fontColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Constants.backgroundColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: TextStyle(color: Constants.orange, fontSize: 15),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Constants.orange),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          ),
        ),
        // routes: routes,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
            case SettingsPage.routeName:
            case ChecklistDetailsPage.routeName:
              FlutterStatusbarcolor.setStatusBarColor(
                Constants.blue,
                animate: true,
              );
              break;
            case PackingTipsPage.routeName:
              FlutterStatusbarcolor.setStatusBarColor(
                Colors.transparent,
                animate: true,
              );
              break;
          }

          return MaterialPageRoute(
            settings: settings,
            builder: routes[settings.name],
          );
        },
      ),
    );
  }
}
