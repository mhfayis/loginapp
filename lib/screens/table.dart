import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tablescreen extends StatefulWidget {
  const Tablescreen({super.key});

  @override
  State<Tablescreen> createState() => _TablescreenState();
}

class _TablescreenState extends State<Tablescreen> {
// ignore: prefer_const_literals_to_create_immutables
  Widget bodyData() => DataTable(columns: <DataColumn>[
         DataColumn(
            label: Text("first name"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              print(ascending);
            },
            tooltip: "to display name"),
        const DataColumn(
            label: Text("last name"), numeric: true, tooltip: "to display name")
      ],
       rows: names.map((e) => DataRow(cells: <DataCell>[
        DataCell(Text(e.firstname)),
        DataCell(Text(e.lastname))
       ])).toList()
      //  const <DataRow>[
      //   DataRow(cells: <DataCell>[
      //     DataCell(Text("")),
      //     DataCell(Text("parufsl"))
      //   ])
      // ]
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('horizontal data table'),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class name {
  String firstname;
  String lastname;

  name({required this.firstname, required this.lastname});
}

var names = <name>[
  name(firstname: "john", lastname: "kurishigal"),
  name(firstname: "tintu", lastname: "mon"),
  name(firstname: "raju", lastname: "bai"),
  name(firstname: "john", lastname: "basco"),
  name(firstname: "randy", lastname: "orten"),
  name(firstname: "vasko", lastname: "don"),
  name(firstname: "maya", lastname: "nathi"),
];
