import 'package:flutter/material.dart';

class TextButtonUtils {
  static TextButton buildTextButton({
    required String label,
    required VoidCallback onPressed,
    required BuildContext context,
    required MaterialStateProperty<Size?> minimumSize,
    required MaterialStateProperty<Size?> maxmumSize,
    
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
        minimumSize: minimumSize,
        maximumSize: maxmumSize,
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
