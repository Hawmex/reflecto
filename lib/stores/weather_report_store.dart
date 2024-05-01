import 'dart:async';

import 'package:navand/navand.dart';

import '../models/weather_report.dart';

final weatherReportStore = WeatherReportStore();

final class WeatherReportStore extends Store {
  Object? _activeCallbackIdentity;
  WeatherReport? weatherReport;

  void _updateWeatherReport() {
    final callbackIdentity = Object();

    _activeCallbackIdentity = callbackIdentity;

    WeatherReport.getCurrent().then((final value) {
      if (_activeCallbackIdentity == callbackIdentity) {
        setState(() => weatherReport = value);
      }
    });
  }

  @override
  void initialize() {
    super.initialize();

    _updateWeatherReport();

    Timer.periodic(
      const Duration(minutes: 5),
      (final timer) => _updateWeatherReport(),
    );
  }
}
