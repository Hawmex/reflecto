import 'package:navand/navand.dart';

import '../widgets/weather.dart';
import 'clock.dart';

final class DigitalWatch extends StatelessWidget {
  const DigitalWatch({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return const DomWidget(
      'div',
      style: Style({
        'display': 'flex',
        'flex-flow': 'row',
        'justify-content': 'space-between',
        'gap': '16px',
        'width': '100%',
      }),
      children: [Clock(), Weather()],
    );
  }
}
