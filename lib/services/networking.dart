import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class NetWorkHelper{
  NetWorkHelper({@required this.url});
  final String url;

  Future getData() async{
    http.Response response =  await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      return converter.jsonDecode(data);

    }
    else{
      print(response.statusCode);
    }
  }
}