import 'package:navand/navand.dart';

import '../stores/weather_report_store.dart';
import 'icon.dart';

final class Weather extends ConsumerWidget<WeatherReportStore> {
  const Weather({super.key, super.ref});

  @override
  Widget build(final BuildContext context, final WeatherReportStore store) {
    return DomWidget(
      'div',
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'align-items': 'end',
        'gap': '8px',
      }),
      children: store.weatherReport != null
          ? [
              Icon(
                store.weatherReport!.isDay
                    ? store.weatherReport!.condition.dayIcon
                    : store.weatherReport!.condition.nightIcon,
                style: const Style({'font-size': '48px'}),
              ),
              DomWidget(
                'div',
                children: [
                  Text(
                    store.weatherReport!.isDay
                        ? store.weatherReport!.condition.dayText
                        : store.weatherReport!.condition.nightText,
                  ),
                  const Text('، '),
                  DomWidget(
                    'span',
                    style: const Style({
                      'direction': 'ltr',
                      'display': 'inline-flex',
                    }),
                    children: [Text('${store.weatherReport!.temperature}°C')],
                  )
                ],
              ),
            ]
          : [const Text('در حال دریافت داده‌ی آب و هوا...')],
    );
  }
}
