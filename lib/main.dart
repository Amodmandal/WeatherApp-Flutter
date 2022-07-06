import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/weather_api_client.dart';
import 'package:weatherapp/views/additional_information.dart';
import 'package:weatherapp/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  weatherApiClient client = weatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("pokhara");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 250, 219),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 178, 178, 176),
          elevation: 0.0,
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 232, 166),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: currentweather(Icons.wb_sunny_rounded,
                          "${data!.temp}", "${data!.cityName}"),
                    ),
                  ),
                  SizedBox(),
                  const Text(
                    'Additional Information',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(color: Colors.amber, thickness: 1),
                  const SizedBox(height: 20),
                  Container(
                    child: additionalInformation(
                        "${data!.wind}",
                        "${data!.humidity}",
                        "${data!.pressure}",
                        "${data!.feels_like}"),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
