import 'package:flutter/foundation.dart';
import 'dart:async';

class DeBouncer {
  final int milliseconds;
  Timer? _timer;

  DeBouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
