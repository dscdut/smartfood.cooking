import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key, this.content}) : super(key: key);

  final String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Palette.pink500,
            ),
            Text(
              content ?? "",
              style: const TextStyle(
                color: Palette.gray500,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
