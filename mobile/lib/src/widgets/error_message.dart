import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, this.content}) : super(key: key);

  final String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              PhosphorIcons.warning,
              color: Palette.orange500,
              size: 32,
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
