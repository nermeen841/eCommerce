import 'package:flutter/material.dart';
import 'package:shop_app/screens/products_list/product_list.dart';

// ignore: must_be_immutable
class Brands extends StatelessWidget {
  List<String> images = [
    "assets/images/6852.jpg",
    "assets/images/6865.jpg",
    "assets/images/40515.jpg",
    "assets/images/6852.jpg",
    "assets/images/6865.jpg",
    "assets/images/40515.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.separated(
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                            title: "",
                          ))),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: images.length),
    );
  }
}
