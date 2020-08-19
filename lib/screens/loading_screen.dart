import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

const apiKey = '7fa13502414bfba5161d2b5274c33dab';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  void getData() async{
    http.Response response =  await http.get('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey');
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = converter.jsonDecode(data);
      double temp = decodedData['main']['temp'];
      int condition = decodedData(data)['weather'][0]['id'];
      String city = decodedData(data)['name'];
    }
    else{
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}