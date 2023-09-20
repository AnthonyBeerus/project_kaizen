import 'package:flutter/material.dart';

class AlertDialogUtils {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required List<Widget> actions,
  }) async {
    return showDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      ),
    );
  }
}
