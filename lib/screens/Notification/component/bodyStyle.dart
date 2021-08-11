import 'package:flutter/material.dart';

import '../../../constants.dart';

class BodyStyle extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  final double hieght;
  final String imagePath;

  const BodyStyle(
      {Key key,
      this.title,
      this.description,
      this.width,
      this.hieght,
      this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: width,
            height: hieght,
            child: Image.asset(
              "$imagePath",
              fit: BoxFit.cover,
            )),
        Text(
          title,
          style: headingStyle,
        ),
        Text(
          description,
          // style: subheadingStyle,
        ),
      ],
    );
  }
}
