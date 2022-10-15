import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class table extends StatefulWidget {
  const table({super.key});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('horizontal data table'),),);
  }
}