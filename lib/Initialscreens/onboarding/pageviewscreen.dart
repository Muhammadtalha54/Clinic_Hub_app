import 'package:clinic_hub_app/Initialscreens/onboarding/components/onboardingcomponent.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Obscreens extends StatefulWidget {
  final String ImagePath, textTitle, TextMessage;
  const Obscreens({
    super.key,
    required this.ImagePath,
    required this.textTitle,
    required this.TextMessage,
  });

  @override
  State<Obscreens> createState() => _ObscreensState();
}

class _ObscreensState extends State<Obscreens> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.mainbackgroundcolor,
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              // color: Colors.white,
              // color: Color.fromARGB(255, 61, 56, 56),
              ),
          child: Onboaringimageandtext(
            textmessage: widget.TextMessage,
            imagepath: widget.ImagePath,
            texttitle: widget.textTitle,
          )),
    );
  }
}
