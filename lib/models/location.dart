import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

class Location {
  final String city;

  Location.fromJson(final dynamic data) : city = data['city'] as String;

  static Future<Location> getCurrent() async {
    final response = await html.HttpRequest.getString(
      Uri.https('api.db-ip.com', 'v2/free/self').toString(),
    );

    return Location.fromJson(jsonDecode(response));
  }
}
