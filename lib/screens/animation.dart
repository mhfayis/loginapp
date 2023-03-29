import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';

class Animationpage extends StatefulWidget {
  const Animationpage({super.key});

  @override
  State<Animationpage> createState() => _AnimationpageState();
}

class _AnimationpageState extends State<Animationpage>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;

  // @override
  // void initState() {
  //   super.initState();
  //   _arrowAnimationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  //   // _arrowAnimation =
  //   //     Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  // }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: Text('Hello, world!'),
    );
  }

  //  Scaffold(
  //   appBar: AppBar(
  //     title: Text("Animation", style: TextStyle(fontStyle: FontStyle.italic)),
  //   ),
  //   body: Column(
  //     children: [
  //   Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10),
  //     height: 300,
  //     width: 300,
  //     child: const FlutterLogo(),
  //   ),
  //  AnimatedBuilder(
  //     animation: _arrowAnimationController,
  //     builder: (context, child) => Transform.rotate(
  //           angle: _arrowAnimation.value,
  //           child: Icon(
  //             Icons.expand_more,
  //             size: 50.0,
  //             color: Colors.black,
  //           ),
  //         ),
  //   ),
  //   OutlineButton(
  //     color: Colors.white,
  //     textColor: Colors.black,
  //     padding: const EdgeInsets.all(12.0),
  //     child: Text('Start Icon Animation'),
  //     onPressed: () {
  //       _arrowAnimationController.isCompleted
  //           ? _arrowAnimationController.reverse()
  //           : _arrowAnimationController.forward();
  //     },
  //     splashColor: Colors.red,
  //   )
  //   ],
  // ),
  // );
}
