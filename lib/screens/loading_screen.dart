import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}');
    print('Longitude: ${location.longitude}');
  }

  void getData() async {
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if(response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);
      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    //getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
