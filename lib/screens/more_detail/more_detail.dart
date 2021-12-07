import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'componnent/detail_card.dart';
import 'componnent/product_reviews.dart';
import 'componnent/users_reviews.dart';
import 'package:easy_localization/easy_localization.dart';

class MoreDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        primary: true,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ProductDescriptioncard(
            title: LocalKeys.DESCRIPTION.tr(),
            detail: "fsfsgwrlhr[hehtelegwflserqqq \n darfkpak[pekgwsr[hkwshokp",
          ),
          spaceH(10),
          ProductDescriptioncard(
            title: LocalKeys.SPCIFICATION.tr(),
            detail: "fsfsgwrlhr[hehtelegwflserqqq \n darfkpak[pekgwsr[hkwshokp",
          ),
          spaceH(10),
          ProductDescriptioncard(
            title: LocalKeys.FEATURES.tr(),
            detail: "fsfsgwrlhr[hehtelegwflserqqq \n darfkpak[pekgwsr[hkwshokp",
          ),
          spaceH(10),
          ProductReviews(),
          spaceH(10),
          UsersReviewsComments()
        ],
      ),
    );
  }
}
