import 'package:navand/navand.dart';
import 'package:reflecto/app.dart';
import 'package:reflecto/stores/interaction_status_store.dart';
import 'package:reflecto/stores/location_store.dart';
import 'package:reflecto/stores/weather_report_store.dart';

void main() {
  runApp(
    Provider(
      stores: [interactionStatusStore, locationStore, weatherReportStore]
          .map((final store) => store..initialize())
          .toList(),
      child: const App(),
    ),
  );
}
