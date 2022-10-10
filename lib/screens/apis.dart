import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/models/picmodal.dart';
import 'package:login/models/user.dart';

Future getresult({required String number}) async {
  final _responce =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  print(_responce.body);
  return _responce.body;
}

Future<List<Usermodel>> getfacebookresult({required String number}) async {
  final _responces =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  print(_responces.body);
  // var v = (jsonDecode(_responces.body));
  // print(v['address']['street']);
  // print(v['address']['geo']['lat']);
  return Usermodel.listFromJson(jsonDecode(_responces.body));
}

Future<String> getforgotresult({required String number}) async {
  final _responce = await http.get(Uri.parse("https://dummyjson.com/products"));
  print(_responce.body);
  return _responce.body;
}

_newAPi() {}
