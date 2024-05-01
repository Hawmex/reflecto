import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import '../stores/location_store.dart';
import 'location.dart';
import 'weather_condition.dart';

class WeatherReport {
  final double temperature;
  final WeatherCondition condition;
  final bool isDay;

  WeatherReport.fromJson(final dynamic data)
      : temperature = data['current']['temp_c'] as double,
        condition = WeatherCondition.fromCode(
          data['current']['condition']['code'] as int,
        ),
        isDay = data['current']['is_day'] as int == 1;

  static Future<WeatherReport> getCurrent() async {
    final response = await html.HttpRequest.getString(
      Uri.https(
        'api.weatherapi.com',
        'v1/current.json',
        {
          'key': '485bc78b3b2640079ab183902240105',
          'q': locationStore.location?.city ??
              (await Location.getCurrent()).city,
          'aqi': 'no',
        },
      ).toString(),
    );

    return WeatherReport.fromJson(jsonDecode(response));
  }
}
