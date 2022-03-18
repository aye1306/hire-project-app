import 'package:flutter/material.dart';
import 'package:project_application/constant/myConstant.dart';
import 'package:project_application/screens/covidtodayscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Covid Report',
                      style: TextStyle(
                          color: MyConstant().primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'เข้าสู่ระบบ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                MyConstant().SpaceHeigh(20.0),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (nameController.text == "62011211081@msu.ac.th" &&
                            passwordController.text == "1234") {
                          RouteAuthentication(context, const CovidTodayScreen(),
                              nameController.text);
                        } else {
                          NormalDialog(context, "ข้อมูลไม่ถูกต้อง");
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyConstant().RedColor),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}

Future<void> RouteAuthentication(
    BuildContext context, Widget MyWidget, String email) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("email", email);
  preferences.setString("name", "อภิรัฐ หงส์อาจ");
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => MyWidget,
  );
  // Navigator.pushAndRemoveUntil(context, route, (route) => false);
  Navigator.push(context, route);
}

Future<void> NormalDialog(BuildContext context, String messege) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(messege),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
