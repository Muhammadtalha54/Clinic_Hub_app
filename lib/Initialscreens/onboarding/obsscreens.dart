import 'package:clinic_hub_app/Initialscreens/onboarding/components/onboardingcomponent.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
this is the screen that is displayed in the pageview everytime with different data 
that it got from parametes */

class Obscreens extends StatefulWidget {
  /*
  1.Imagepath = for the asset image path 
  2. textTitle = for the title of the screen
  3. textmessage  == for the message that will be displayed on this screen */
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
      backgroundColor: Colors.white,
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              // color: Colors.white,
              // color: Color.fromARGB(255, 61, 56, 56),
              ),
          // the values are passed to anothe reusable component that is defined in a seperate stateless class
          child: Onboaringimageandtext(
            textmessage: widget.TextMessage,
            imagepath: widget.ImagePath,
            texttitle: widget.textTitle,
          )),
    );
  }
}
