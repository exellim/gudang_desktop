import 'dart:html';

import 'package:gudang/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const ADD_URL = "";

  Future<String> addUser(UserModel userModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: userModel.toJson());
    if (response.statusCode == 200) {
      print("add response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
