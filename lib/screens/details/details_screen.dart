import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:shop_app/screens/product_search/searchScreen.dart';
import '../../constants.dart';
import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())),
          ),
          spaceW(10),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              showSearch(
                context: context,
                delegate: ProductSearch(),
              );
            },
            child: Stack(
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                  height: getProportionateScreenWidth(46),
                  width: getProportionateScreenWidth(46),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.search_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Body(product: product),
    );
  }
}

// class ProductDetailsArguments {
//   final Product product;

//   ProductDetailsArguments({@required this.product});
// }
