import 'package:flutter/material.dart';

class ReusableDialog {
  // Method to show the dialog
  static void show(
    BuildContext context, {
    required String title,
    required String content,
    required String buttonText,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // If an onPressed function is passed, execute it
                if (onPressed != null) {
                  onPressed();
                }
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
