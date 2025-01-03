import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_Viewmodel/Controllers/Splashcontroller.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/onboarding/onboarding.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Onboardingscreens(),
    //       ));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Bind the controller with GetX
    Get.put(SplashController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.mainbackgroundcolor,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
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
            SizedBox(
                width: width * 0.9,
                height: height * 0.2,
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    "Clinic Hub - \nSimplifying Healthcare Management!",
                    textStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ])),
            const SizedBox(height: 20),
            Obx(() {
              // Observing the isLoading value from SplashController
              return SplashController().isLoading.value
                  ? CircularProgressIndicator() // Show loading while data is being fetched
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
