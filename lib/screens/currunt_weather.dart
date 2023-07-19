import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String loacation) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$temp°c",
          style: TextStyle(fontSize: 46),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$loacation",
          style: TextStyle(fontSize: 25, color: Colors.grey),
        )
      ],
    ),
  );
}
