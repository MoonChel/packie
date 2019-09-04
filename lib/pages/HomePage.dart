import 'package:flutter/material.dart';
import 'package:packie/components/_all.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.supervised_user_circle, size: 50),
              SizedBox(height: 20),
              Text("Hello, Let's start packing!", style: textTheme.headline),
              Text("It takes only a few minutes...", style: textTheme.title),
              SizedBox(height: 50),
              Expanded(
                child: CheckLists(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
