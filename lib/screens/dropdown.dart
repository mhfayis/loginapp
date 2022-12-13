import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class dropdown extends StatefulWidget {
  const dropdown({super.key});

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  final _List = ['item1', 'item2', 'item3', 'item4', 'item5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dropdown'),
      ),
      body: Center(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButtonFormField(
                  onChanged: (value) {
                    print(value);
                  },
                  items: _List.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList()),
            ),
          )
        ]),
      ),
    );
  }
}
