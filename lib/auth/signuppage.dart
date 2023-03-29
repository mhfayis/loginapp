import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:login/controllers/authcontroller.dart';
import 'package:login/home/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

final ctrl = Get.put(authcontroller());

// final TextEditingController _username = TextEditingController(text: '');
// final TextEditingController _password = TextEditingController(text: '');
// final TextEditingController _email = TextEditingController(text: '');

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.network(
            "https://png.pngtree.com/thumb_back/fh260/background/20191125/pngtree-landing-page-modern-and-elegant-color-image_323321.jpg"),
        Text(
          'WELCOME BACK !',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: TextField(
            // controller: ctrl.username,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                hintText: 'username'),
            autofocus: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: TextField(
            controller: ctrl.email,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: 'example@gmail.com'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: TextField(
            controller: ctrl.password,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                prefixIcon: Icon(Icons.lock_sharp),
                border: OutlineInputBorder(),
                hintText: 'password'),
            autofocus: false,
            obscureText: true,
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await ctrl.signup();
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Obx(
              () => Container(
                child: ctrl.loading.value
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('sign-up'),
              ),
            ),
            style: ElevatedButton.styleFrom(fixedSize: Size(300, 30))),
        Expanded(flex: 7, child: Container(color: Colors.white)),
        Text('Or connect with social'),
        Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('phone'),
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('google'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, fixedSize: Size(150, 30)),
            )
          ],
        ),
        Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            )),
      ]),
    );
  }
}
