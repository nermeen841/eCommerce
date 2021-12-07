import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/screens/products_list/componnent/product_card_withBadge.dart';

class ProductListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProductCard(
          name: "T-Shirt",
          imge: "assets/images/tshirt.png",
          badgeColor: Colors.yellow,
          badgeTextColor: Colors.black,
          badgetext: "Discount 10 %",
          price: 200,
          oldPrice: 100,
          note: "Free Shipping",
          rating: 4,
          press: () {},
        ),
        spaceH(20),
        ProductCard(
          name: "Shoes",
          imge: "assets/images/shoes2.png",
          badgeColor: Colors.orange,
          badgeTextColor: Colors.white,
          badgetext: "Limited Stock",
          price: 200,
          note: "Free Shipping",
          rating: 5,
          press: () {
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(32.0)),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Error.svg",
                                width: 50,
                                height: 50,
                              ),
                              Center(
                                child: Text(
                                  "Limited Stock product",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              spaceH(10),
                              Center(
                                child: Text(
                                  "This product is not currently available. \n If available it may be delivered as a separate orde",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  maxLines: 2,
                                ),
                              ),
                              spaceH(10),
                              DefaultButton(
                                text: LocalKeys.ADDTOCARTBUTTON.tr(),
                                press: () => Navigator.pushNamed(
                                    context, CartScreen.routeName),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("CANCEL"))
                            ]);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        spaceH(20),
        ProductCard(
          name: "T-Shirt",
          imge: "assets/images/product 1 image.png",
          badgeColor: Colors.red,
          price: 200,
          note: "Free Shipping",
          rating: 4,
          press: () {},
        ),
        spaceH(20),
        ProductCard(
          name: "Wireless Controller",
          imge: "assets/images/Image Popular Product 1.png",
          badgeColor: Colors.red,
          badgetext: "Out of Stock",
          badgeTextColor: Colors.white,
          price: 200,
          note: "Free Shipping",
          rating: 4,
          press: () {
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(32.0)),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Error.svg",
                                width: 50,
                                height: 50,
                              ),
                              Center(
                                child: Text(
                                  "Out of Stock",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              spaceH(10),
                              Center(
                                child: Text(
                                  "This product is not currently available \n We will notify you when it's available again",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  maxLines: 2,
                                ),
                              ),
                              spaceH(10),
                              DefaultButton(
                                text: LocalKeys.ADDTOCARTBUTTON.tr(),
                                press: () => Navigator.pushNamed(
                                    context, CartScreen.routeName),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("CANCEL"))
                            ]);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
