import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  void getData() async{
    http.Response response =  await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = converter.jsonDecode(data);
      var temp = decodedData['main']['temp'];
      var condition = decodedData(data)['weather'][0]['main'];
      var city = decodedData(data)['name'];
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