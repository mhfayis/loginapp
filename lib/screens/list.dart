import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/games.dart';
import 'package:login/screens/table.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List data = [
    {"StudentID": 1, "StudentName": "padayappa", "ParentName": "raveentharan"},
    {"StudentID": 2, "StudentName": "Unnikuttan", "ParentName": "appukkuttan"},
    {"StudentID": 3, "StudentName": "tintu mon", "ParentName": "soman"},
    {"StudentID": 4, "StudentName": "baskaran pilla", "ParentName": "pilla"},
    {"StudentID": 5, "StudentName": "shaji phappan", "ParentName": "vasu"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"},
    {"StudentID": 6, "StudentName": "dingan", "ParentName": "superman"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Game()));
                  },
                  icon: Icon(Icons.apple)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => table()));
                  },
                  icon: Icon(Icons.games)),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('students detalis'),
          centerTitle: true,
        ),
        body: ListView(
          children: data
              .map((e) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(color: Colors.cyan),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 15),
                                child: Text("ID:" + e["StudentID"].toString()))
                          ],
                        ),
                        Text(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          'Student Name:' + e["StudentName"].toString(),
                        ),
                        Text(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          'son of:' + e["ParentName"].toString(),
                        ),
                        Row(
                          children: [
                            PopupMenuButton(
                              child: Center(child: Text('click here')),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: Text('button 1'),
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("it's a snackbar"),
                                      ));
                                    },
                                  ),
                                ];
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
