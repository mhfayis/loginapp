import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/screens/add.dart';

import 'package:login/screens/facebook.dart';

import 'package:http/http.dart' as http;
import 'package:login/screens/mainmenu.dart';

import 'package:login/screens/splash.dart';
import 'package:login/auth/signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

// late SharedPreferences sharedPreferences;
late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();

  runApp(
    login(),
  );
}

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(),
    );
  }
}

class loginpage extends StatelessWidget {
  loginpage({Key? key}) : super(key: key);
  final TextEditingController _username = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');

  apifunction(String username, String pass) async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    Response response = await http.post(url, body: {
      'title': username,
      'body': pass,
      'userId': "1",
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
              "https://png.pngtree.com/thumb_back/fh260/background/20191125/pngtree-landing-page-modern-and-elegant-color-image_323321.jpg"),
          Text(
            'WELCOME BACK !',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              controller: _username,
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
              controller: _password,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  prefixIcon: Icon(Icons.lock_sharp),
                  border: OutlineInputBorder(),
                  hintText: 'password'),
              autofocus: false,
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signuppage()));
                    },
                    child: Text(
                      'create new account',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'forgot password?',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                if (_username.text.isEmpty || _password.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("password or username is emty"),
                  ));
                  return;
                }
                Response res =
                    await apifunction(_username.text, _password.text);
                if (res.statusCode >= 200 && res.statusCode <= 299) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainMenu()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("password or username is wrong"),
                  ));
                }
              },
              child: Text('log in'),
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
        ],
      ),
    );
  }
}
