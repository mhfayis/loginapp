import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Arguments {
  final String text;

  Arguments({required this.text});
}

class RouteData extends StatefulWidget {
  const RouteData({super.key, required this.arguments});
  final Arguments arguments;

  @override
  State<RouteData> createState() => _RouteDataState();
}

class _RouteDataState extends State<RouteData> {
  @override
  void initState() {
    print(widget.arguments.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("routed result")),
      body: Center(
          child: Container(
              child: Column(
        children: [
          Text(
            "routed result is ",
            style: TextStyle(fontSize: 50),
          ),
          Text(widget.arguments.text),
          Text(widget.arguments.text),
        ],
      ))),
    );
  }
}
