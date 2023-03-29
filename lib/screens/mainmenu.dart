import 'dart:io';
import 'package:login/screens/add.dart';
import 'package:login/screens/animation.dart';
import 'package:login/screens/cameraOnApage.dart';
import 'package:login/screens/choicechip.dart';
import 'package:login/screens/dropdown.dart';
import 'package:login/screens/facebook.dart';
import 'package:login/screens/musicplayer.dart';
import 'package:login/screens/newTask.dart';
import 'package:login/screens/qrGenaratter.dart';
import 'package:login/screens/qrscanner.dart';
import 'package:login/screens/routdemofirst.dart';
import 'package:login/screens/sandbox.dart';
import 'package:login/screens/todos.dart';
import 'package:login/screens/videoPlayer.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:camera_android/camera_android.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/screens/list.dart';
import 'package:login/screens/routedata.dart';
import 'package:login/screens/whatsapp.dart';

import 'home.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  File? _image;

  Future getImage(ImageSource img) async {
    print(img.name);
    final image = await ImagePicker().pickImage(source: img);
    if (image == null) return;

    final iamgeTemporary = File(image.path);
    setState(() {
      this._image = iamgeTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("main menu"),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => RouteDataOne()));
                        },
                        child: Text("passing route data")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => ListData()));
                        },
                        child: Text("list")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => WhatsApp()));
                        },
                        child: Text("whats app")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Text("camara")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => CameraApp()));
                        },
                        child: Text("cam page")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => FirstroutPage()));
                        },
                        child: Text("demo route")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => TaskOne()));
                        },
                        child: Text("task")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push((context),
                              MaterialPageRoute(builder: (context) => Todos()));
                        },
                        child: Text("online spoing whith api")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => ChoiceChipPage()));
                        },
                        child: Text("choicechip")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => MusicPlayerPage()));
                        },
                        child: Text("music player")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage()));
                        },
                        child: Text("music player")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => dropdown()));
                        },
                        child: Text("drop down")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Add()));
                        },
                        child: Text("pass item")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Facebook()));
                        },
                        child: Text("list of student")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text("Animation")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Qrgen()));
                        },
                        child: Text("Qr gen")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Qrscan()));
                        },
                        child: Text("Qr scanner")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sandbox()));
                        },
                        child: Text("Animation demo2")),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Todos()));
                        },
                        child: Text("product ditails")),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
