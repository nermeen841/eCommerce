import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imge;
  final double rating;
  final double price;
  final double oldPrice;
  final String note;
  final Color badgeColor;
  final Color badgeTextColor;
  final String badgetext;
  final Function press;
  const ProductCard(
      {Key key,
      this.name,
      this.imge,
      this.rating,
      this.price,
      this.oldPrice,
      this.note,
      this.badgeColor,
      this.badgetext,
      this.press,
      this.badgeTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => DetailsScreen())),
      child: Card(
        elevation: 2,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        imge,
                        width: 100,
                        fit: BoxFit.fitHeight,
                      ),
                      // (badgetext != null)
                      //     ? Align(
                      //         alignment: (applang() == 'en')
                      //             ? Alignment.topLeft
                      //             : Alignment.topRight,
                      //         child: Container(
                      //           color: badgeColor,
                      //           child: Center(
                      //             child: Text(
                      //               badgetext,
                      //               style: headingStyle.copyWith(
                      //                   color: badgeTextColor, fontSize: 12),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                  ),
                  spaceW(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SmoothStarRating(
                          allowHalfRating: false,
                          onRated: (v) {},
                          starCount: 5,
                          rating: rating,
                          size: 20.0,
                          isReadOnly: true,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.blur_on,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          spacing: 0.0),
                      Row(
                        children: [
                          Text(
                            "$price \$",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          spaceW(20),
                          (oldPrice != null)
                              ? Text(
                                  "$oldPrice \$",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                )
                              : Container(),
                        ],
                      ),
                      Text(note, style: Theme.of(context).textTheme.bodyText1),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: kPrimaryColor,
                              onPressed: press,
                              child: Row(
                                children: [
                                  Text(
                                    LocalKeys.ADDTOCARTBUTTON.tr(),
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  spaceW(5),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          spaceW(30),
                          InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: HexColor("#898A8D"),
                              )
                              // SvgPicture.asset(
                              //   "assets/icons/Heart Icon_2.svg",
                              //   color: Theme.of(context).cardColor,
                              // )
                              ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            (badgetext != null)
                ? Align(
                    alignment: (applang() == 'en')
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: Container(
                      color: badgeColor,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          badgetext,
                          style: headingStyle.copyWith(
                              color: badgeTextColor, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
