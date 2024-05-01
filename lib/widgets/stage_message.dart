import 'package:navand/navand.dart';

import '../models/message.dart';
import 'icon.dart';

final class StageMessage extends StatelessWidget {
  final Message message;

  const StageMessage(this.message, {super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return DomWidget(
      'div',
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'align-items': 'center',
        'justify-content': 'center',
        'gap': '16px',
      }),
      children: [
        if (message.icon != null)
          Icon(message.icon!, style: const Style({'font-size': '48px'})),
        DomWidget(
          'span',
          style: const Style({
            'font-size': '32px',
            'font-weight': '300',
            'line-height': '48px',
            'text-align': 'center',
          }),
          children: [Text(message.value)],
        )
      ],
    );
  }
}
