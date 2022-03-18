import 'package:flutter/material.dart';
import 'package:project_application/constant/DrawerSide.dart';
import 'package:project_application/constant/myConstant.dart';

class DevScreen extends StatefulWidget {
  const DevScreen({Key? key}) : super(key: key);

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        title: Text("ผู้จัดทำ"),
        backgroundColor: MyConstant().RedColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: Image(
                  image: AssetImage("assets/images/profile.jpg"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyConstant().H1("นายอภิรัฐ หงส์อาจ"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyConstant().H1("รหัส 62011211081"),
            ],
          )
        ],
      ),
    );
  }
}
