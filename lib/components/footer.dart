import 'package:navand/navand.dart';

import '../widgets/feature.dart';
import '../widgets/features.dart';

final class Footer extends StatelessWidget {
  const Footer({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return const DomWidget(
      'div',
      style: Style({
        'display': 'flex',
        'flex-flow': 'row',
        'flex-wrap': 'wrap',
        'gap': '32px',
        'justify-content': 'space-between',
        'align-items': 'end',
      }),
      children: [
        Features([
          Feature(text: 'خدانگهدار', icon: 'waving_hand'),
          Feature(text: 'آهنگ', icon: 'music_note'),
          Feature(text: 'ویدیو', icon: 'smart_display'),
          Feature(text: 'داشبورد', icon: 'dashboard'),
        ]),
        DomWidget(
          'span',
          style: Style({'font-size': '14px', 'font-weight': '600'}),
          children: [Text('آینه‌ی هوشمند')],
        )
      ],
    );
  }
}
