import 'dart:math';

class Message {
  final String value;
  final String? icon;

  const Message(this.value, {this.icon});

  Duration get duration =>
      Duration(milliseconds: min(value.split(' ').length * 1000, 5000));
}
