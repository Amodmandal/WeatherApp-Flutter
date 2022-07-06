import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class weatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=668a1a51daef21955faf9f2cda275a53&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
