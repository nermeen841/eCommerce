import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubCategorySlider extends StatelessWidget {
  List<Widget> image = [
    ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/images/Image Banner 2.png",
        width: 350,
        height: 150,
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          "assets/images/Image Banner 3.png",
          width: 350,
          height: 150,
          fit: BoxFit.cover,
        )),
    ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/images/Image Banner 2.png",
        width: 350,
        height: 150,
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/images/Image Banner 3.png",
        width: 350,
        height: 150,
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: image,
      options: CarouselOptions(
        height: 150,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
