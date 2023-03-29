import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:login/home/homepage.dart';
import 'package:login/main.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/mainmenu.dart';
import 'package:path/path.dart';

class authcontroller extends GetxController {
// step 1 create intance

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  TextEditingController resetemail = TextEditingController();

  var loading = false.obs;

// step 2 create functions

  signup() async {
    try {
      // print('hrhfer');
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await addUser();
      await verifyemil();
      loading.value = false;
    } catch (e) {
      print(e); 
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

// add user database

  addUser() async {
    print('vfyrewvfyr');
    Usermodel user = Usermodel(
      username: username.text,
      email: auth.currentUser?.email,
    );
    await db
        .collection("user")
        .doc(auth.currentUser?.uid)
        .collection("profile")
        .add(user.toJson());
  }
// signOut

  signout() async {
    await auth.signOut();
  }

// signin

  signin() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginpassword.text);
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

// verifyemil

  verifyemil() async {
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar("email", "send");
  }
}
