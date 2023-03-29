import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/main.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                //  await auth.signout();
                await auth.signOut();
                // Get.offAll(() => main());
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => login()));
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        children: [
          auth.currentUser!.emailVerified
              ? SizedBox(
                  height: 1,
                )
              // : Text(auth.currentUser!.email! + " not verifyed"),
              : SizedBox(
                  height: 150,
                ),
          Text(auth.currentUser!.email!),
          Text(auth.currentUser!.emailVerified
              ? "emailVerified"
              : "email not verifyed")
        ],
      ),
    );
  }
}
