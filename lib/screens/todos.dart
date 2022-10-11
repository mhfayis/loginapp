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
  List<Products> result = [];

  bool isLoading = true;

  _loadapi() async {
    setState(() {
      isLoading = true;
    });
    try {
      result = await getforgotresult();
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
    _loadapi();
  }

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
                          decoration:
                              InputDecoration(hintText: "Enter a number"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
                  _loadapi();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: result.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("product name: ${result[index].brand}"),
                        Text("ug:${result[index].description}"),
                        Image.network(result[index].thumbnail!)
                      ],
                    ),
                  );
                }))

        // : ListView(children: [
        //     Container(
        //       child: Row(
        //         children: [
        //           Image.network(
        //             '${}',
        //             width: 100,
        //             height: 100,
        //           ),
        //           Column(
        //             children: [Text('data'), Text('data')],
        //           ),
        //           ElevatedButton(onPressed: () {}, child: Text('EDIT')),
        //           ElevatedButton(onPressed: () {}, child: Text('EDIT')),
        //         ],
        //       ),
        //     )
        //   ]),
        );
  }
}
