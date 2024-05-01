import 'package:navand/navand.dart';

import 'icon.dart';

final class Feature extends StatelessWidget {
  final String text;
  final String icon;

  const Feature({required this.text, required this.icon, super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return DomWidget(
      'div',
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'gap': '8px',
        'align-items': 'center',
      }),
      animation: const Animation(
        keyframes: [
          Keyframe(offset: 0, style: Style({'opacity': '0'})),
          Keyframe(offset: 1, style: Style({'opacity': '1'}))
        ],
        duration: Duration(seconds: 3),
        easing: Easing(0.2, 0, 0.4, 1),
        direction: AnimationDirection.alternate,
        fillMode: AnimationFillMode.both,
        iterations: double.infinity,
      ),
      children: [Icon(icon), Text(text)],
    );
  }
}
