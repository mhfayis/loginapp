import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/main.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp>
    with SingleTickerProviderStateMixin {
  // camera conroller
  late CameraController controller;

  //  local storage
  XFile? pic;
  Future<void> loadCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
      // for cach error
    }).catchError((e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  // for dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late TabController tabcontroller;
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
  void initState() {
    loadCamera();
    tabcontroller = TabController(vsync: this, length: 4, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: (Colors.green),
        // for click the photo
        onPressed: () async {
          pic = await controller.takePicture();
          setState(() {});
        },
        child: Icon(Icons.message),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
        bottom: TabBar(
          tabs: [
            Container(
              child: Tab(
                icon: Icon(Icons.camera_alt),
              ),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("STATUS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),
          ],
          indicatorColor: Colors.white,
          controller: tabcontroller,
        ),
      ),
      body: TabBarView(controller: tabcontroller, children: [
        // for body creation
        if (!controller.value.isInitialized)
          Container()
        else
          CameraPreview(controller),
        ListView(
            children: data
                .map((e) => Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/assets/Km.png'),
                                radius: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      style: TextStyle(fontSize: 25),
                                      e["StudentName"].toString(),
                                    ),
                                    Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      e["ParentName"].toString(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList()),
        Text("STATUS"),
        if (pic == null)
          Container(
            child: Center(child: Text("no file")),
          )
        else
          Image.file(File(pic!.path))
      ]),
    );
  }
}
