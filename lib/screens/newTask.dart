import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskOne extends StatelessWidget {
  const TaskOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 140),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
                        Text(
                          "ADD YOUR HOTEL!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 109, 103, 103),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Fill up with details to post your hotel",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    Expanded(flex: 3, child: Container()),
                    Image.asset(
                      "lib/assets/Km.png",
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
              ),
              Text(
                "TYPE",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 109, 103, 103),
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: const Text("FOOD & ROOMS"),
                  ),
                  Chip(label: const Text("FOOD ONLY")),
                  Chip(label: const Text("ROOMS ONLY"))
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("HOTEL NAME",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 109, 103, 103))),
              TextField(decoration: InputDecoration(hintText: ('hotel name'))),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("LOCATION",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 109, 103, 103))),
              TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_outlined),
                      hintText: ('choose from goolgle map'))),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("ABOUT HOTEL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 109, 103, 103))),
              TextField(decoration: InputDecoration(hintText: ('about hotel'))),
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("FOOD",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 109, 103, 103))),
                  Text("ROOMS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 109, 103, 103))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 50),
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("ADD MENU",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                          )
                        ]),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://img.freepik.com/premium-vector/slice-pizza-illustrations-cartoon_125446-714.jpg?w=2000"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey))),
                    Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 50),
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("ADD ROOMS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                          )
                        ]),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoXXtbDmw9Auzw51xCH9TswFC8bh0dVeSf7g&usqp=CAU"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("PROCEED"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 117, 193, 255),
                      fixedSize: Size(500, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
