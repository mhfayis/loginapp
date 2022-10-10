import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/models/picmodal.dart';
import 'package:login/screens/apis.dart';

class Todos extends StatefulWidget {
  Todos({Key? key}) : super(key: key);

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  TextEditingController _textcon = TextEditingController();
  List<product> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('enter any numbers '),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {},
                        controller: _textcon,
                        decoration: InputDecoration(hintText: "Enter a number"),
                      ),
                      ElevatedButton(
                        onPressed: () async {},
                        child: Text('Submit'),
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("data"),
        actions: [
          IconButton(
              onPressed: () {
                getforgotresult(number: '');
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView(children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                'lib/assets/tom.jpg',
                width: 100,
                height: 100,
              ),
              Column(
                children: [Text('data'), Text('data')],
              ),
              ElevatedButton(onPressed: () {}, child: Text('EDIT')),
              ElevatedButton(onPressed: () {}, child: Text('EDIT')),
            ],
          ),
        )
      ]),
    );
  }
}
