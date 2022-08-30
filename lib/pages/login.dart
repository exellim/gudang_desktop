import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gudang/comp/appColor.dart';
import 'package:gudang/pages/home.dart';
import 'package:gudang/pages/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  late bool passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    passwordVisible = false;
  }

// Login
  Future login(BuildContext cont) async {
    var url = "http://localhost/gudang/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": usernameTEC.text,
      "password": passwordTEC.text,
    });

    var data = jsonDecode(response.body.toString());
    print(data.toString());
    if (data == "Error") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect username and or password!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Welcome! ${usernameTEC.text}")));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(
                    username: '${usernameTEC.text}',
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        color: AppColor.primary,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 450.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColor.tertiary),
                ),
                SizedBox(height: 50),
                TextFormField(
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      login(context);
                    }
                  },
                  controller: usernameTEC,
                  decoration: InputDecoration(
                      fillColor: Colors.white54,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      login(context);
                    }
                  },
                  controller: passwordTEC,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      icon: Icon(Icons.login, size: 18),
                      label: Text("Login"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login(context);
                        }
                      },
                    ),
                    SizedBox(width: 20),
                    OutlinedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      icon: Icon(Icons.add, size: 18),
                      label: Text("Register"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
