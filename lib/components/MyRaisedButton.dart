import 'package:flutter/material.dart';
import 'package:packie/constants.dart';

class MyRaisedButton extends StatelessWidget {
  MyRaisedButton({
    this.text,
    this.color = Constants.blue,
    this.onPressed,
  });

  final String text;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: color,
        child: Text(text, style: textTheme.button),
        onPressed: onPressed,
      ),
    );
  }
}
