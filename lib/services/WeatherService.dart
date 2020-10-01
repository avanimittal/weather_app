import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/APIResponse.dart';
import 'package:weatherapp/models/weather.dart';

class WeatherService {
  Future<APIResponse<WeatherModel>> getWeather(String address) async {
    return http
        .get(
      Uri.encodeFull(
          'http://api.openweathermap.org/data/2.5/weather?q=$address&units=metric&appid=a3ad5f5871af6f892541a7f3c9fbe8d8'),
    )
        .then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        final weather = WeatherModel.fromJson(jsonResponse);
        print(weather.name);
        return APIResponse<WeatherModel>(data: weather);
      }
      throw Error();
    }).catchError((e) {
      return APIResponse<WeatherModel>(
          error: true, errorMessage: "Unable to get the data");
    });
  }
}
