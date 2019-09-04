import 'package:flutter/material.dart';

import 'package:packie/components/_all.dart';
import 'package:packie/constants.dart';

class ChecklistDetailsPage extends StatelessWidget {
  static const routeName = '/ChecklistDetailsPage';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: Constants.backArrorColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Bahamas Packing List", style: textTheme.headline),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(flex: 1, child: CategoryIcon()),
                  SizedBox(width: 5),
                  Expanded(flex: 1, child: CategoryIcon()),
                  SizedBox(width: 5),
                  Expanded(flex: 1, child: CategoryIcon()),
                  SizedBox(width: 5),
                  Expanded(flex: 1, child: CategoryIcon()),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Checkbox(
                              value: false,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(width: 10),
                            Expanded(child: Text("T-short")),
                            Icon(Icons.more_vert, color: Constants.blue),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Constants.backgroundColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Constants.orange,
                      child: Text(
                        "Clear",
                        style: textTheme.button.copyWith(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
