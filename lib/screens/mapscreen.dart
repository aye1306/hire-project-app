import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_application/constant/DrawerSide.dart';
import 'package:project_application/constant/myConstant.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({Key? key}) : super(key: key);

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  double? lat, lng;
  File? _imageFile;

  String? _nameShop, _addressShop, _phoneShop, _urlImage;

  @override
  void initState() {
    super.initState();
    finglatlng();
  }

  Future<Null> finglatlng() async {
    LocationData? locationData = await findData();
    setState(() {
      lat = locationData!.latitude;
      lng = locationData.longitude;
    });
  }

  Future<LocationData?> findData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSide(),
        appBar: AppBar(
          title: Text("แผนที่"),
          backgroundColor: MyConstant().RedColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "ที่อยู่ของคุณ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8.0,
                height: 16.0,
              ),
              lat == null ? MyConstant().ShowProgress() : InfoFormMap(),
            ],
          ),
        ));
  }

  Set<Marker> MyMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("myshopmark"),
        position: LatLng(lat!, lng!),
        infoWindow: InfoWindow(
          title: 'ที่อยู่ของคุณ',
          snippet: 'ละติจูต = $lat ลองติจูต = $lng',
        ),
      )
    ].toSet();
  }

  Container InfoFormMap() {
    LatLng latLng = LatLng(lat!, lng!);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );

    return Container(
      padding: EdgeInsets.all(10),
      height: 500,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: MyMarker(),
      ),
    );
  }
}
