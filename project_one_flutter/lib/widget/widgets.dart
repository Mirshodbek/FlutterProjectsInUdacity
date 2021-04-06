import 'package:flutter/material.dart';
import 'package:project_one_flutter/constants.dart';

class IconButtons extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  IconButtons({@required this.iconData, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
      ),
      onPressed: onPressed,
    );
  }
}

class RowHeader extends StatelessWidget {
  final String title;

  RowHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: kHeaderStyle,
        ),
      ],
    );
  }
}

class RowBody extends StatelessWidget {
  final IconData iconData;
  final String text;

  RowBody({this.iconData, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(
            iconData,
          ),
        ),
        Text(
          text,
          style: kBodyStyle,
        ),
      ],
    );
  }
}
