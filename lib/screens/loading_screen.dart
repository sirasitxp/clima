import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



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
    NetWorkHelper netWorkHelper = NetWorkHelper(url:"https://api.openweathermap.org"
        "/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}