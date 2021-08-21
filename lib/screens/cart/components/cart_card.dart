import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/app_cubit/cubit.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                widget.cart.product.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "\$${widget.cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                    children: [
                      TextSpan(
                          text: " x${widget.cart.numOfItem}",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
                spaceW(50),
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    AppCubit.get(context).decreaseQuantity();
                  },
                ),
                spaceW(10),
                Text(
                  "${AppCubit.get(context).counter}",
                  style:
                      headingStyle.copyWith(color: kPrimaryColor, fontSize: 16),
                ),
                spaceW(10),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {
                    AppCubit.get(context).increaseQuantity();
                  },
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
