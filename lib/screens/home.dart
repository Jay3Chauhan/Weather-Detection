import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_detection/model/locationpopup.dart';
import 'package:weather_detection/model/weather_model.dart';
import 'package:weather_detection/screens/additional_information.dart';
import 'package:weather_detection/screens/currunt_weather.dart';
import 'package:weather_detection/services/weather_api_client.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData(String cityName) async {
    Weather? newData = await client.getCurrentWeather(cityName);
    setState(() {
      data = newData;
    });
  }

  @override
  void initState() {
    super.initState();
    getData("Bardoli");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: Text(
              'Weather Detection',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.black,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _showDialog();
                },
                icon: Icon(Icons.location_city),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  getCurrentLocation();
                },
                icon: Icon(Icons.location_on),
                color: Colors.black,
              ),
            ]),
        backgroundColor: Colors.white,
        body: data == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 35),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 237, 230),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.fromLTRB(15, 25, 25, 25),
                      child: currentWeather(Icons.wb_sunny_rounded,
                          "${data!.temp}", "${data!.cityname}"),
                    ),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Additional Information",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 25,
                  ),
                  additionalInformation("${data!.wind}", "${data!.pressure}",
                      "${data!.humidity}", "${data!.feel_like}")
                ],
              ));
  }

  final _formKey = GlobalKey<FormState>();
  late String _cityname;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter City Name'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter city name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a city name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cityname = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  getData(_cityname);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        String cityName = placemarks[0].locality!;
        getData(cityName);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: 'Error fetching current location.',
        gravity: ToastGravity.CENTER,
      );
    }
  }
}
