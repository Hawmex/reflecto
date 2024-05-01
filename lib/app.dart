import 'package:navand/navand.dart';

import 'components/digital_watch.dart';
import 'components/footer.dart';
import 'components/stage.dart';

final class App extends StatelessWidget {
  const App({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return const DomWidget(
      'div',
      style: Style({
        'display': 'grid',
        'grid-template-rows': 'max-content 1fr max-content',
        'align-items': 'center',
        'width': '100vw',
        'height': '100vh',
        'padding': '32px',
        'gap': '32px',
        'background': '#000000',
        'color': '#ffffff',
        'font-family': 'Vazirmatn RD FD',
        'font-size': '16px',
        'line-height': '1.5',
        'direction': 'rtl',
        'user-select': 'none',
        'color-scheme': 'dark',
      }),
      children: [DigitalWatch(), Stage(), Footer()],
    );
  }
}
