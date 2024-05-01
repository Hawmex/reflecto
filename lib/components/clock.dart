import 'dart:async';

import 'package:navand/navand.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../extensions/date_time_string.dart';

final class Clock extends StatefulWidget {
  const Clock({super.key, super.ref});

  @override
  State createState() => _ClockState();
}

final class _ClockState extends State<Clock> {
  late Jalali _dateTime;
  late final Timer _dateTimeTimer;

  @override
  void initialize() {
    super.initialize();

    _dateTime = Jalali.now();

    _dateTimeTimer = Timer.periodic(
      const Duration(minutes: 1),
      (final timer) => setState(() => _dateTime = Jalali.now()),
    );
  }

  @override
  void dispose() {
    _dateTimeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return DomWidget(
      'div',
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'gap': '8px',
      }),
      children: [
        DomWidget(
          'span',
          style: const Style({'font-size': '32px', 'font-weight': '500'}),
          children: [Text(_dateTime.toCustomTimeString())],
        ),
        Text(_dateTime.toCustomDateString()),
      ],
    );
  }
}
