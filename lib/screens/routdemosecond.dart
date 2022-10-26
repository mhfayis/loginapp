import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/screens/route.dart';

import 'apis.dart';

class Arguments {
  final String text;
  Arguments({required this.text});
}

class SecondRoutPageState extends StatefulWidget {
  const SecondRoutPageState({super.key, required this.arguments});
  final Arguments arguments;

  @override
  State<SecondRoutPageState> createState() => _SecondRoutPageStateState();
}

class _SecondRoutPageStateState extends State<SecondRoutPageState> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("enterd valu is: ${widget.arguments.text}")],
        ),
      )),
    );
  }
}
