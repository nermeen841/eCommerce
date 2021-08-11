import 'package:flutter/material.dart';

class TwenAnimation extends StatefulWidget {
  @override
  State<TwenAnimation> createState() => _TwenAnimationState();
}

class _TwenAnimationState extends State<TwenAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/icons/success.png",
            //40%
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class RippleAnimation extends StatefulWidget {
//   @override
//   _RippleAnimationState createState() => _RippleAnimationState();
// }

// class _RippleAnimationState extends State<RippleAnimation>
//     with TickerProviderStateMixin {
//   AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       lowerBound: 0.5,
//       duration: Duration(seconds: 3),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     return AnimatedBuilder(
//       animation:
//           CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
//       builder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             _buildContainer(150 * _controller.value),
//             _buildContainer(200 * _controller.value),
//             _buildContainer(250 * _controller.value),
//             _buildContainer(300 * _controller.value),
//             _buildContainer(350 * _controller.value),
//             Align(
//               child: Icon(
//                 Icons.check_circle,
//                 size: 44,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildContainer(double radius) {
//     return Container(
//       width: radius,
//       height: radius,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.green.withOpacity(1 - _controller.value),
//       ),
//     );
//   }
// }
