import 'package:flutter/material.dart';

class Weather {
  String? cityname;
  double? temp;
  double? wind;
  int? pressure;
  double? feel_like;
  int? humidity;

  Weather({
    this.cityname,
    this.feel_like,
    this.humidity,
    this.pressure,
    this.temp,
    this.wind,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json["name"] as String;
    temp = json["main"]["temp"];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feel_like = json['main']['feels_like'];
  }
}
