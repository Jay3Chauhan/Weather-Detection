import 'package:flutter/material.dart';

TextStyle titleFont = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);
TextStyle infoFont = TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInformation(
    String wind, String pressure, String humidity, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wind",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Pressure",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "$pressure",
                  style: infoFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Feel Like",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "$feels_like",
                  style: infoFont,
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}
