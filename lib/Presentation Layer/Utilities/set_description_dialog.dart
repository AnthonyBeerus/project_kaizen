import 'package:flutter/material.dart';
import 'package:phenom_fitness/Presentation%20Layer/Utilities/alert_dialog_design.dart';
import 'package:phenom_fitness/Presentation%20Layer/Utilities/text_button.dart';

class SetDescriptionUtil {
  void setDescription(BuildContext context) {
    AlertDialogUtils.showAlertDialog(
      title: 'Sets',
      content: 'A Set...',
      context: context,
      actions: [
        TextButtonUtils.buildTextButton(
          label: 'OK',
          onPressed: () {
            Navigator.pop(context);
          },
          context: context,
          minimumSize: MaterialStateProperty.all(const Size(62, 40)),
          maxmumSize: MaterialStateProperty.all(const Size(62, 40)),
        ),
      ],
    );
  }
  
}