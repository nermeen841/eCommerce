import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/PageTransitionAnimation.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/more_detail/more_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "${LocalKeys.BRAND.tr()} : Techno-Tech",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "${LocalKeys.SELLER.tr()} : B-TECH",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            "${LocalKeys.NOTE.tr()} : -----------",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        spaceH(10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(
                "${product.rating}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset("assets/icons/Star Icon.svg"),
            ],
          ),
        ),
        spaceH(10),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${product.price} \$",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
              spaceW(10),
              Text(
                "${product.price} \$",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
                  product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () =>
                Navigator.push(context, SizeTransition3(MoreDetailScreen())),
            child: Row(
              children: [
                Text(
                  LocalKeys.MOREDETAIL.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
