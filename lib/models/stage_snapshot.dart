import 'dart:async';
import 'dart:js' as js;
import 'dart:math';

import 'package:navand/navand.dart';

import '../widgets/stage_message.dart';
import 'message.dart';

class StageSnapshot {
  final Widget content;
  final Future<void> Function() future;

  const StageSnapshot._({required this.content, required this.future});

  factory StageSnapshot.message(final List<Message> messages) {
    final pickedMessage = messages[Random().nextInt(messages.length)];

    return StageSnapshot._(
      content: StageMessage(pickedMessage),
      future: () => Future.delayed(pickedMessage.duration),
    );
  }

  factory StageSnapshot.audio(final String source) {
    final completer = Completer<void>();

    return StageSnapshot._(
      content: DomWidget(
        'audio',
        style: const Style({'width': '100%', 'height': '100%'}),
        attributes: {'src': source, 'autoplay': '', 'controls': ''},
        events: {'ended': (final event) => completer.complete()},
      ),
      future: () => completer.future,
    );
  }

  factory StageSnapshot.video(final String source) {
    final completer = Completer<void>();

    return StageSnapshot._(
      content: DomWidget(
        'video',
        attributes: {'src': source, 'autoplay': '', 'controls': ''},
        style: const Style({'width': '100%', 'height': '100%'}),
        events: {'ended': (final event) => completer.complete()},
      ),
      future: () => completer.future,
    );
  }

  factory StageSnapshot.powerbi() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => js.context['renderPowerBI'].apply(['powerbi']),
    );

    return StageSnapshot._(
      content: const DomWidget(
        'div',
        id: 'powerbi',
        style: Style({'width': '100%', 'height': '100%'}),
      ),
      future: () => Future.value(null),
    );
  }
}
