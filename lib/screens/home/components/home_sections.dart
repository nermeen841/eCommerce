import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/products_list/product_list.dart';
import 'package:shop_app/screens/sub_category/subCategory.dart';
import '../../../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../components/PageTransitionAnimation.dart';

class HomeSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SectionTitle(
            title: LocalKeys.SECTIONS.tr(),
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubCategoryScreen())),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView.builder(
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.vertical,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3),
            itemBuilder: (context, index) {
              return SectionsCard(
                path: "assets/images/Image Banner 3.png",
              );
            }),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class SectionsCard extends StatelessWidget {
  final String path;
  // final GestureTapCallback press;

  const SectionsCard({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            SizeTransition3(ProductListScreen(
              title: "",
            ))),
        child: Container(
          width: getProportionateScreenWidth(150),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Stack(children: [
              Container(
                width: 150,
                height: 80,
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
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
                  width: 150,
                  height: 30,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "Hair Care",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // TextSpan(text: "$numOfBrands Brands")
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
