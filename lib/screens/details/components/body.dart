import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

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
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ColorDots(product: widget.product),
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.remove,
                          press: () {
                            setState(() {
                              counter--;
                            });
                            if (counter < 1) {
                              setState(() {
                                counter = 1;
                              });
                            }
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        Text(
                          "$counter",
                          style: headingStyle.copyWith(color: kPrimaryColor),
                        ),
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.add,
                          showShadow: true,
                          press: () {
                            setState(() {
                              counter++;
                            });
                          },
                        ),
                      ],
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
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
