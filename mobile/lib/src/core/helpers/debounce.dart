import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debounce {
  Duration delay;
  Timer? _timer;

  Debounce(
    this.delay,
  );

  call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
