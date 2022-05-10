import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debounce {

  Debounce(
    this.delay,
  );

  Duration delay;
  Timer? _timer;

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
  }
}
