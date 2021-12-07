import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${LocalKeys.REVIEW.tr()} (140)",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        spaceH(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("4.5",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
            SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {},
                starCount: 5,
                rating: 4,
                size: 30.0,
                isReadOnly: true,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.blur_on,
                color: Colors.yellow,
                borderColor: Colors.yellow,
                spacing: 0.0),
          ],
        ),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.5,
          progressColor: Colors.yellow,
        ),
        spaceH(10),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.4,
          progressColor: Colors.yellow,
        ),
        spaceH(10),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.3,
          progressColor: Colors.yellow,
        ),
        spaceH(10),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.2,
          progressColor: Colors.yellow,
        ),
        spaceH(10),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.1,
          progressColor: Colors.yellow,
        ),
      ],
    );
  }
}
