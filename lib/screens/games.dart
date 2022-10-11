import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/models/picmodal.dart';
import 'package:login/screens/apis.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
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
      appBar: AppBar(
        title: Center(child: Icon(Icons.games_outlined)),
        actions: [
          IconButton(
              onPressed: () {
                _loadapi();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                result[index].thumbnail!),
                                            fit: BoxFit.fill),
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Text(
                                    "${result[index].brand}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${result[index].price}",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // for rating stare
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          color:
                                              i < result[index].rating!.round()
                                                  ? Colors.green
                                                  : Colors.grey,
                                        )
                                    ],
                                  ),
                                  Text(
                                    '${result[index].description}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'In stock: ${result[index].stock}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'brand:${result[index].brand}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'category:${result[index].category}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                );
              })),
    );
  }
}
