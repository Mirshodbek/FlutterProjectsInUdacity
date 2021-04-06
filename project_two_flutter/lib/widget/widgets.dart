import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final String point;
  final Function onPressed;

  TextButtons({@required this.point, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        point,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
