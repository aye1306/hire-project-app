import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_application/constant/DrawerSide.dart';
import 'package:project_application/constant/myConstant.dart';
import 'package:http/http.dart' as http;
import 'package:project_application/models/covidTodayModel.dart';

class CovidTodayScreen extends StatefulWidget {
  const CovidTodayScreen({Key? key}) : super(key: key);

  @override
  State<CovidTodayScreen> createState() => _CovidTodayScreenState();
}

class _CovidTodayScreenState extends State<CovidTodayScreen> {
  CovidTodayModel? covidTodayModel;
  Future<void> getDataCovid() async {
    String url = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
    var response = await http.get(Uri.parse(url));

    var jsonRes = json.decode(response.body);
    for (var item in jsonRes) {
      setState(() {
        covidTodayModel = CovidTodayModel.fromJson(item);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        title: MyConstant().H1("ผู้ติดเชื้อโควิดวันนี้"),
        backgroundColor: MyConstant().RedColor,
      ),
      body: covidTodayModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Covidcase(
                  MyConstant().primaryColor,
                  covidTodayModel!.newCase!.toString(),
                  covidTodayModel!.totalCase!.toString(),
                ),
                Covidrecovered(
                  Colors.blue.shade400,
                  covidTodayModel!.newRecovered.toString(),
                  covidTodayModel!.totalRecovered.toString(),
                ),
                Coviddeath(
                  Colors.green.shade400,
                  covidTodayModel!.newDeath.toString(),
                  covidTodayModel!.totalDeath.toString(),
                )
              ],
            ),
    );
  }

  Row Covidcase(Color c, String newcase, String totalcase) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: c,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        "assets/images/7847522_virus_dissease_covid_icon.png"), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    'รายใหม่',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    newcase + " คน",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "ผู้ติดเชื้อทั้งหมด :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyConstant().Spacewidth(5),
                      Text(
                        totalcase,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row Covidrecovered(Color c, String newrecover, String totalrecover) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: c,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        "assets/images/375260_ambulance_cross_hospital_icon.png"), // no matter how big it is, it won't overflow
                  ),
                  title: const Text(
                    'กำลังรักษา',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    newrecover + " คน",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "รักษาหายแล้วทั้งหมด :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyConstant().Spacewidth(5),
                      Text(
                        totalrecover,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row Coviddeath(Color c, String newdead, String totaldead) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: c,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        "assets/images/6092264_corona_coronavirus_covid_dath_dead_icon.png"), // no matter how big it is, it won't overflow
                  ),
                  title: const Text('เสียชีวิตวันนี้',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(newdead+" คน",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "ยอดรวมผู้เสียชีวิต :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyConstant().Spacewidth(5),
                      Text(
                        totaldead,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
