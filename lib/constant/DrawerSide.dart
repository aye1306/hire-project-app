import 'package:flutter/material.dart';
import 'package:project_application/constant/myConstant.dart';
import 'package:project_application/screens/Devsccreen.dart';
import 'package:project_application/screens/Homescreen.dart';
import 'package:project_application/screens/covidtodayscreen.dart';
import 'package:project_application/screens/mapscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({Key? key}) : super(key: key);

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  String? email;
  String? name;
  Future<void> getDatauser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? _email = await preferences.getString("email");
    String? _name = await preferences.getString("name");
    setState(() {
      email = _email;
      name = _name;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatauser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: MyConstant().RedColor,
            ),
            accountName: Text(
              name == null ? "name" : name!,
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              email == null ? "email" : email!,
              style: TextStyle(fontSize: 18),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          ListTile(
            title: const Text(
              'ผู้ติดเชื้อโควิดวันนี้',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.people),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CovidTodayScreen(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            title: const Text(
              'แผนที่',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.map),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => mapScreen(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            title: const Text(
              'ผู้จัดทำ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.fact_check),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DevScreen(),
                ),
                (route) => false,
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  'ออกจากระบบ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                onTap: () {
                  SignoutProcess(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<Null> SignoutProcess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => HomeScreen(),
    ),
    (route) => false,
  );
  //exit(0);
}
