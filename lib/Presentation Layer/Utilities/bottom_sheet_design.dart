import 'package:flutter/material.dart';

class BottomSheetUtil {
  static Future<void> showModalBottomSheet({
    required BuildContext context,
    required String title,
 
    required RoundedRectangleBorder shape,
  }) async {
    return showModalBottomSheet(
        title: title,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ), 
      );
  }
}
