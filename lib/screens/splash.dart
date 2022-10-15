import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [Expanded(flex: 3 ,child: Container()),
        Image.asset(
          'lib/assets/tom.jpg',
          height: 300,
        ),
       Expanded( flex: 3 ,child: Container()),
      ],
    )));
  }

  Future gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return loginpage();
    }));
  }
}
