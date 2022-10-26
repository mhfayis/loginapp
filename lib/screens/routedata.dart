import 'package:flutter/material.dart';

import 'package:login/screens/route.dart';

class RouteDataOne extends StatefulWidget {
  const RouteDataOne({super.key});

  @override
  State<RouteDataOne> createState() => _RouteDataOneState();
}

class _RouteDataOneState extends State<RouteDataOne> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("routing first page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("testing posistion"),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RouteDataPage(
                            arguments: Arguments(text: _controller.text))));
              },
              child: Text("Go to second page"))
        ],
      ),
    );
  }
}
