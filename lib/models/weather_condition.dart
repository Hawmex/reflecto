class WeatherCondition {
  final String dayText;
  final String nightText;
  final String dayIcon;
  final String nightIcon;

  const WeatherCondition._({
    required this.dayText,
    required this.nightText,
    required this.dayIcon,
    required this.nightIcon,
  });

  factory WeatherCondition.fromCode(final int code) {
    return switch (code) {
      1000 => const WeatherCondition._(
          dayText: 'آفتابی',
          nightText: 'صاف',
          dayIcon: 'clear_day',
          nightIcon: 'clear_night',
        ),
      1003 => const WeatherCondition._(
          dayText: 'کمی ابری',
          nightText: 'کمی ابری',
          dayIcon: 'partly_cloudy_day',
          nightIcon: 'partly_cloudy_night',
        ),
      1006 || 1009 => const WeatherCondition._(
          dayText: 'ابری',
          nightText: 'ابری',
          dayIcon: 'cloudy',
          nightIcon: 'cloudy',
        ),
      1030 => const WeatherCondition._(
          dayText: 'غبارآلود',
          nightText: 'غبارآلود',
          dayIcon: 'water',
          nightIcon: 'water',
        ),
      1063 => const WeatherCondition._(
          dayText: 'احتمال رگبار باران',
          nightText: 'احتمال رگبار باران',
          dayIcon: 'rainy',
          nightIcon: 'rainy',
        ),
      1066 => const WeatherCondition._(
          dayText: 'احتمال رگبار برف',
          nightText: 'احتمال رگبار برف',
          dayIcon: 'weather_snowy',
          nightIcon: 'weather_snowy',
        ),
      1069 => const WeatherCondition._(
          dayText: 'احتمال رگبار بوران',
          nightText: 'احتمال رگبار بوران',
          dayIcon: 'grains',
          nightIcon: 'grains',
        ),
      1072 => const WeatherCondition._(
          dayText: 'احتمال بارش نم نم باران',
          nightText: 'احتمال بارش نم نم باران',
          dayIcon: 'water_drop',
          nightIcon: 'water_drop',
        ),
      1087 => const WeatherCondition._(
          dayText: 'احتمال بارش تندری',
          nightText: 'احتمال بارش تندری',
          dayIcon: 'thunderstorm',
          nightIcon: 'thunderstorm',
        ),
      1114 => const WeatherCondition._(
          dayText: 'برف و بوران',
          nightText: 'برف و بوران',
          dayIcon: 'air',
          nightIcon: 'air',
        ),
      1117 => const WeatherCondition._(
          dayText: 'کولاک',
          nightText: 'کولاک',
          dayIcon: 'snowing',
          nightIcon: 'snowing',
        ),
      1135 || 1147 => const WeatherCondition._(
          dayText: 'مه‌آلود',
          nightText: 'مه‌آلود',
          dayIcon: 'water',
          nightIcon: 'water',
        ),
      1150 || 1153 || 1168 || 1171 => const WeatherCondition._(
          dayText: 'باران نم نم',
          nightText: 'باران نم نم',
          dayIcon: 'water_drop',
          nightIcon: 'water_drop',
        ),
      1180 ||
      1183 ||
      1186 ||
      1189 ||
      1192 ||
      1195 ||
      1198 ||
      1201 ||
      1240 ||
      1243 ||
      1246 =>
        const WeatherCondition._(
          dayText: 'بارش باران',
          nightText: 'بارش باران',
          dayIcon: 'rainy',
          nightIcon: 'rainy',
        ),
      1204 || 1207 || 1249 || 1249 || 1252 => const WeatherCondition._(
          dayText: 'بارش بوران',
          nightText: 'بارش بوران',
          dayIcon: 'grains',
          nightIcon: 'grains',
        ),
      1210 ||
      1213 ||
      1216 ||
      1219 ||
      1222 ||
      1225 ||
      1255 ||
      1258 =>
        const WeatherCondition._(
          dayText: 'بارش برف',
          nightText: 'بارش برف',
          dayIcon: 'weather_snowy',
          nightIcon: 'weather_snowy',
        ),
      1237 || 1261 || 1264 => const WeatherCondition._(
          dayText: 'بارش تگرگ',
          nightText: 'بارش تگرگ',
          dayIcon: 'grains',
          nightIcon: 'grains',
        ),
      1273 || 1276 => const WeatherCondition._(
          dayText: 'بارش باران با تندر',
          nightText: 'بارش باران با تندر',
          dayIcon: 'thunderstorm',
          nightIcon: 'thunderstorm',
        ),
      1279 || 1282 => const WeatherCondition._(
          dayText: 'بارش برف با تندر',
          nightText: 'بارش برف با تندر',
          dayIcon: 'thunderstorm',
          nightIcon: 'thunderstorm',
        ),
      _ => throw RangeError.value(code),
    };
  }
}
