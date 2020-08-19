import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '7fa13502414bfba5161d2b5274c33dab';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;


  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetWorkHelper netWorkHelper = NetWorkHelper(url:"https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}