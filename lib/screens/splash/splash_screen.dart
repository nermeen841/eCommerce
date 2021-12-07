import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app/components/user_location_container.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/onBoarding/onBoarding.dart';

class MyCustomSplashScreen extends StatefulWidget {
  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  // ignore: unused_field
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController _controller;
  Animation<double> animation1;

  final Geolocator geolocator = Geolocator();

  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        UserLocationBar.currentPosition = position;
        // TapToSeeOffers.hasLocation = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    this.getCurrentLocation();
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(OnBoardingScreen()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _textOpacity,
                  child: Image.asset(
                    "assets/images/white.png",
                    height: 30,
                    width: _width * 0.5,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                width: MediaQuery.of(context).size.width * 0.5,
                // height: _width / _containerSize,
                // width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("assets/images/technoStore 5646.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image.asset('assets/images/file_name.png')
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}



















// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/components/user_location_container.dart';
// import 'package:shop_app/screens/onBoarding/onBoarding.dart';

// class SplashScreen extends StatefulWidget {
//   static String routeName = "/spllash";

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final Geolocator geolocator = Geolocator();

//   getCurrentLocation() {
//     geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         UserLocationBar.currentPosition = position;
//         // TapToSeeOffers.hasLocation = true;
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   @override
//   void initState() {
//     this.getCurrentLocation();
//     super.initState();
//     Timer(
//       Duration(seconds: 3),
//       () => Navigator.of(context).pushNamed(OnBoardingScreen.routeName),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 0.0,
//         backgroundColor: kPrimaryColor,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage("assets/images/background.jpg"),
//           fit: BoxFit.cover,
//         )),
//         child: Center(
//           child: Container(
//             width: 200,
//             height: 200,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/139905-OT30AT-347.jpg"),
//                   fit: BoxFit.contain,
//                 )),
//             // child: Image.asset(
//             //   "assets/images/139905-OT30AT-347.jpg",
//             //   fit: BoxFit.contain,
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }
