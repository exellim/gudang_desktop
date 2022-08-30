import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:gudang/comp/appColor.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:gudang/comp/sidebar.dart';
import 'package:gudang/pages/login.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(username);
}

class _HomePageState extends State<HomePage> {
  String? userName;
  _HomePageState(this.userName);

  List<Icon> IconButtons = [
    Icon(Icons.groups_rounded, size: 100),
    Icon(Icons.groups_outlined, size: 100),
    Icon(Icons.description, size: 100),
    Icon(Icons.category_rounded, size: 100),
  ];

  List pages = ["Daftar Pegawai", "Pegawai Borongan", "Laporan", "Kategori"];
  List routes = ["/home", "/home", "/home", "/login"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(
              username: 'admin',
            ),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(
              username: 'admin',
            ),
        '/login': (context) => LoginPage()
      },
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColor.tertiary, AppColor.gradient],
                        stops: [0.0, 1.0]),
                  ),

                  // Left
                  child: SideBar(
                    userName: userName.toString(),
                  )),

              // Content
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColor.primary, AppColor.secondary],
                        stops: [0.0, 1.0]),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColor.tertiary,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 50.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  Shadow(
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 0.0,
                                    color: AppColor.tertiary,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            SafeArea(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                ),
                                itemCount: pages.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, routes[index]);
                                    },
                                    child: Card(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Image.network("${IconButtons[index]}"),
                                        IconButtons[index],
                                        Text("${pages[index]}"),
                                      ],
                                    )),
                                  );
                                },
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
