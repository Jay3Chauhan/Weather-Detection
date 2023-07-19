import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_detection/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8ae1b95cf878cc7da6ae30bfe4e0f4f7&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityname);
    return Weather.fromJson(body);
  }
}
