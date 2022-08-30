import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:gudang/comp/appColor.dart';
import 'package:gudang/pages/home.dart';
import 'package:gudang/pages/login.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = Size(900, 675);
    appWindow.minSize = initialSize;
    appWindow.title = "Pembukuan Gudang Alpha";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplikasi Pembukuan Gudang',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.primary,
        ),
        home: HomePage(
          username: 'admin',
        ),
        routes: {
          '/home': (context) => HomePage(
                username: 'admin',
              ),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(
                username: 'admin',
              ),
          '/login': (context) => LoginPage(),
        });
  }
}
