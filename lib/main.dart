import 'package:flutter/material.dart';
import 'package:packie/constants.dart';
import 'package:packie/pages/_routes.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Constants.blue);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
