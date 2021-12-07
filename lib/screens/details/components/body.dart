import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/app_cubit/cubit.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ProductImages(product: widget.product),
            InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.share,
                      color: kPrimaryColor,
                      size: 30,
                    )),
              ),
            ),
          ],
        ),
        TopRoundedContainer(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ColorDots(product: widget.product),
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.remove,
                          press: () {
                            AppCubit.get(context).decreaseQuantity();
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        Text(
                          "${AppCubit.get(context).counter}",
                          style: headingStyle.copyWith(color: kPrimaryColor),
                        ),
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.add,
                          showShadow: true,
                          press: () {
                            AppCubit.get(context).increaseQuantity();
                          },
                        ),
                      ],
                    ),
                    TopRoundedContainer(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: LocalKeys.ADDTOCARTBUTTON.tr(),
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen())),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
