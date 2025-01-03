import 'package:flutter/material.dart';

class Confirmationpopupdialoguebox extends StatelessWidget {
  final String? dialogtitle, dialogbody, buttontext;
  final VoidCallback onbuttonpress;
  final Color buttoncolor;
  const Confirmationpopupdialoguebox(
      {super.key,
      this.dialogtitle,
      this.dialogbody,
      this.buttontext,
      required this.onbuttonpress,
      required this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogtitle!),
      content: Text(dialogbody!),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: buttoncolor,
          ),
          //color: Colors.green,
          //  minSize: width! * 0.03,
          // backgroun: Color.fromARGB(207, 211, 80, 80),
          child: Text(
            buttontext!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          //color: Colors.green,
          //  minSize: width! * 0.03,
          // backgroun: Color.fromARGB(207, 211, 80, 80),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Color.fromARGB(255, 38, 38, 38)),
          ),
        ),
      ],
    );
  }
}
