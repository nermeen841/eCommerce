import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/constants.dart';

class ProductDescriptioncard extends StatelessWidget {
  final String title;
  final String detail;

  const ProductDescriptioncard(
      {Key key, @required this.title, @required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            spaceH(20),
            Text(detail, style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
