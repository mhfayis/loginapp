import 'dart:io';
import 'package:login/screens/cameraOnApage.dart';
import 'package:login/screens/routdemofirst.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:camera_android/camera_android.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/screens/list.dart';
import 'package:login/screens/routedata.dart';
import 'package:login/screens/whatsapp.dart';

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
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => RouteDataOne()));
                  },
                  child: Text("passing route data")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => ListData()));
                  },
                  child: Text("list")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => WhatsApp()));
                  },
                  child: Text("whats app")),
              ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Text("camara")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => CameraApp()));
                  },
                  child: Text("cam page")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => FirstroutPage()));
                  },
                  child: Text("demo route")),
            ],
          ),
        ));
  }
}
