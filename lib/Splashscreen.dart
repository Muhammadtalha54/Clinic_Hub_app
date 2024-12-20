import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:clinic_hub_app/Initialscreens/onboarding/onboarding.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // SplashServices splashservices = SplashServices();
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   splashservices.isLogin();
  // }
  void initState() {
    super.initState();
    // Start the timer when the screen loads
    Future.delayed(const Duration(seconds: 3), () {
     Navigator.pushReplacement(
  context,
  CustomPageTransition(page: const Onboardingscreens()),
);

    });
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.mainbackgroundcolor,
      body: Container(
        height: height!,
        width: width!,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: height * 0.4,
                width: width * 0.7,
                child: Image.asset(
                  "assets/images/logomain.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Container(
                width: width * 0.9,
                height: height * 0.2,
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    // speed: 2
                    "Clinic Hub - \nSimplifying Healthcare Management!",
                    textStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
