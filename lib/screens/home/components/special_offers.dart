import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/sub_category/subCategory.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
            child: SectionTitle(
              title: LocalKeys.HOMETITLE.tr(),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubCategoryScreen()),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SpecialOfferCard(
                  height: 210,
                  width: 200,
                  image: "assets/images/Image Banner 2.png",
                  category: "Smartphone",
                  numOfBrands: 18,
                  press: () {},
                ),
                Container(
                  height: 200,
                  child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.71,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 0.1),
                      itemBuilder: (context, index) {
                        return SpecialOfferCard(
                          height: 100,
                          width: 130,
                          image: "assets/images/Image Banner 2.png",
                          category: "Fashion",
                          numOfBrands: 24,
                          press: () {},
                        );
                      }),
                ),

                // SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: getProportionateScreenWidth(width),
          height: getProportionateScreenWidth(height),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: width,
                    height: 30,
                    color: Colors.white54,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "$category\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    // TextSpan(text: "$numOfBrands Brands")
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
