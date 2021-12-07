import 'package:flutter/material.dart';
import '../../../size_config.dart';

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
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          description,
          // style: subheadingStyle,
        ),
      ],
    );
  }
}
