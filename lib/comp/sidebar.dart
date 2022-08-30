import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:gudang/comp/appColor.dart';

class SideBar extends StatefulWidget {
  final String userName;
  const SideBar({Key? key, required this.userName}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState(userName);
}

class _SideBarState extends State<SideBar> {
  String? userName;
  _SideBarState(this.userName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfilePicture(
                      name: '$userName',
                      radius: MediaQuery.of(context).size.width * 0.021,
                      fontsize: MediaQuery.of(context).size.width * 0.032,
                      random: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            userName.toString(),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 2.0,
          color: Colors.white,
        )
      ],
    );
  }
}
