import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Palette.pink500,
      ),
    );
  }
}
