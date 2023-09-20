import 'package:flutter/material.dart';

class TextButtonUtils {
  static TextButton buildTextButton({
    required String label,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return TextButton(
      onPressed: onPressed, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.secondaryContainer,
        ),
        foregroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        maximumSize: MaterialStateProperty.all(const Size(100, 50)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
