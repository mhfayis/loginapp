import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/apis.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController _name = TextEditingController();
  String result = '';
  @override
  void initState() {
    super.initState();
  }

  apiname() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST'),
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Text(
                    'Numbers result',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(result)
                ],
              ),
            )
          ],
        ),
        FloatingActionButton.small(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                        'enter any number to know thw importace of the number '),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
                          controller: _name,
                          decoration:
                              InputDecoration(hintText: "Enter a number"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            result = await getresult(number: _name.text);
                            _name.clear();
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('Submit'),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ]),
    );
  }
}
