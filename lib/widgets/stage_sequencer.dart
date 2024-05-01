import 'dart:async';

import 'package:navand/navand.dart';

import '../models/stage_snapshot.dart';

final class StageSequencer extends StatelessWidget {
  final List<StageSnapshot> snapshots;

  const StageSequencer(this.snapshots, {super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return StreamBuilder<Widget>(
      (final context, final snapshot) {
        return DomWidget(
          'div',
          style: const Style({
            'display': 'flex',
            'align-items': 'center',
            'justify-content': 'center',
            'width': '100%',
            'height': '100%',
            'overflow': 'hidden',
          }),
          children: snapshot.hasData
              ? [snapshot.data!]
              : const [Text('لطفا صبر کنید...')],
        );
      },
      stream: (() {
        late final StreamController<Widget> controller;

        controller = StreamController<Widget>(
          onListen: () async {
            for (final snapshot in snapshots) {
              controller.add(snapshot.content);

              await snapshot.future();
            }

            await controller.close();
          },
        );

        return controller.stream;
      })(),
    );
  }
}
