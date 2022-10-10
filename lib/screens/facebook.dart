import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/apis.dart';

class Facebook extends StatefulWidget {
  Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  final TextEditingController _maincont = TextEditingController();

  List<Usermodel> result = [];

//to create loading
  bool isLoading = true;

  //to call all the list when open the page
  _loadApi() async {
    //to compress error
    try {
      result = await getfacebookresult(number: _maincont.text);
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //Calling api when window opens
    _loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FACE BOOK"),
        ),
        floatingActionButton: FloatingActionButton.small(
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
                          controller: _maincont,
                          decoration:
                              InputDecoration(hintText: "Enter a number"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            _maincont.clear();
                            Navigator.pop(context);
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
        body: isLoading
            //loading icon showing
            ? Center(child: CircularProgressIndicator())
            : result.length == 0
                ? Center(
                    child: Text('No Data'),
                  )

                //  ListView.builder is load what we want
                : ListView.builder(
                    itemCount: result.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text("student id: ${result[index].id}"),
                            Text("student name:${result[index].name}"),
                            Text("Address: ${result[index].address}"),
                            Text("city: ${result[index].address?.city}"),
                            Text("street: ${result[index].address?.street}"),
                            Text("suite: ${result[index].address?.suite}"),
                          ],
                        ),
                      );
                    }))
        //  ListView(
        //     children: result.map((e) {
        //     return Container(
        //       padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey),
        //     borderRadius: BorderRadius.circular(10)),
        // child: Column(
        //   children: [
        //     Text("student id: ${e.id}"),
        //     Text("student name:${e.name}"),
        //     Text("Address: ${e.address}"),
        //     Text("Address: ${e.address?.city}"),
        //     Text("Address: ${e.address?.street}"),
        //     Text("Address: ${e.address?.suite}"),
        //   ],
        // ),
        //     );
        //   }).toList()),
        );
  }
}
