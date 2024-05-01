import 'package:navand/navand.dart';

final class Icon extends StatelessWidget {
  final String value;
  final Style? style;

  const Icon(this.value, {this.style, super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return DomWidget(
      'span',
      classes: {'material-symbols-outlined'},
      style: style,
      children: [Text(value)],
    );
  }
}
