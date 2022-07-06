import 'package:flutter/material.dart';

TextStyle titlefont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
Widget additionalInformation(
    String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Wind',
                  style: titlefont,
                ),
                SizedBox(height: 18),
                Text(
                  'Pressure',
                  style: titlefont,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  wind,
                  style: infoFont,
                ),
                SizedBox(height: 18),
                Text(
                  pressure,
                  style: infoFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity',
                  style: titlefont,
                ),
                SizedBox(height: 18),
                Text(
                  'Feels Like',
                  style: titlefont,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  humidity,
                  style: infoFont,
                ),
                SizedBox(height: 18),
                Text(
                  feelsLike,
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
