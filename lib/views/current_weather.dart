import 'package:flutter/material.dart';
import 'package:weatherapp/views/additional_information.dart';

Widget currentweather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Icon(
          icon,
          color: Colors.orange,
          size: 64,
        ),
        const SizedBox(height: 10),
        Text(
          temp,
          style: TextStyle(fontSize: 50),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 18, color: Color(0xFF5a5a5a)),
        ),
        const SizedBox(height: 20),
       
      ],
    ),
  );
}
