import 'package:cloud_firestore/cloud_firestore.dart';

class loginmodel{

String? id,username,email;

loginmodel({this.email,this.id,this.username});
factory loginmodel.frommap(DocumentSnapshot map){
  return loginmodel( 
    email: map["email"],
    username: map["username"],
    id: map.id
  );
}


Map<String,dynamic> toMap(){

  return {
  //  "id":id,
   "email":email,
   "username":username,

  };
 
}

}