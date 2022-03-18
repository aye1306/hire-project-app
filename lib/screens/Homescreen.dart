import 'package:flutter/material.dart';
import 'package:project_application/constant/myConstant.dart';
import 'package:project_application/screens/Loginscreen.dart';
import 'package:project_application/screens/covidtodayscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getDatauser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? _email = await preferences.getString("email");
    if (_email == null) {
    } else {
      MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => CovidTodayScreen(),
      );
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    }
  }

  Future<Null> CheckPreferences() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? _email = preferences.getString("email");
      if (_email != "null") {
        RouteAuth(CovidTodayScreen());
      } else {}
    } catch (e) {}
  }

  void RouteAuth(Widget widget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => widget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatauser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 530,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    child: const Text('Welcome'),
                    color: MyConstant().RedColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: const BorderSide(color: Colors.white, width: 2)),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    height: 40.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
