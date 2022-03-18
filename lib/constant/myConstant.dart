import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyConstant {
  MyConstant();
  Color primaryColor = Color(0xFFFF4C4C);
  Color RedColor = Color(0xFFDF0303);
  String Homebackground = "";

  SizedBox SpaceHeigh(double h) => SizedBox(
        height: h,
      );
  SizedBox Spacewidth(double w) => SizedBox(
        width: w,
      );

  Text H1(String t) => Text(
        t,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget ShowProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
