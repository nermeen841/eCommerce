import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/screens/products_list/product_list.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Sales"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "today's offer"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Back to School"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Bride offer"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductListScreen(title: categories[index]["text"]))),
          );
        },
        separatorBuilder: (context, index) {
          return spaceW(5);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(80),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.contain,
                ),
              )),
          SizedBox(height: 5),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
