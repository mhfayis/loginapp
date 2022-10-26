import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/screens/routdemosecond.dart';

class FirstroutPage extends StatefulWidget {
  const FirstroutPage({super.key});

  @override
  State<FirstroutPage> createState() => _FirstroutPageState();
}

class _FirstroutPageState extends State<FirstroutPage> {
  final TextEditingController _contro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _contro,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SecondRoutPageState(
                            arguments: Arguments(text: _contro.text)))));
              },
              child: Text('next page with save'))
        ],
      )),
    );
  }
}
