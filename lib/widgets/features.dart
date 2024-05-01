import 'package:navand/navand.dart';

import 'feature.dart';

final class Features extends StatelessWidget {
  final List<Feature> features;

  const Features(this.features, {super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return DomWidget(
      'div',
      style: const Style({
        'display': 'flex',
        'flex-flow': 'row',
        'flex-wrap': 'wrap',
        'gap': '32px',
        'align-items': 'center',
        'justify-content': 'center',
      }),
      children: features,
    );
  }
}
