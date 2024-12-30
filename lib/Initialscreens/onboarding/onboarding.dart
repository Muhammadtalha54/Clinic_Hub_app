import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/selectionscreen.dart';

import 'package:clinic_hub_app/Initialscreens/onboarding/obsscreens.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
/*This is the onboarding screen having pageview on it to show all the onboarding
screens
1. next button moves to next page
2. skip button directly skips to the selection screen

*/

class Onboardingscreens extends StatefulWidget {
  const Onboardingscreens({super.key});

  @override
  State<Onboardingscreens> createState() => _OnboardingscreensState();
}

class _OnboardingscreensState extends State<Onboardingscreens> {
  @override
  PageController pageController = PageController();
  int currentPage = 0;
  var height, width;
  int index = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: height!,
              width: width,
              // pageview
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: const [
                  // this is a reusable component that is being used in the pageview for many times with differnt data
                  Obscreens(
                      ImagePath: "assets/images/onb2.png",
                      textTitle: "Discover Trusted Doctors",
                      TextMessage:
                          "Browse detailed profiles and reviews to find the right doctor for your needs."),
                  Obscreens(
                      ImagePath: "assets/images/onb3.png",
                      textTitle: " Seamless Appointment Booking",
                      TextMessage:
                          "Book appointments quickly and conveniently with our easy-to-use interface"),
                  Obscreens(
                      ImagePath: "assets/images/onb4.png",
                      textTitle: "Efficient Healthcare Management",
                      TextMessage:
                          "Equip doctors with tools to organize schedules and review patient data")
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height! * 0.18,
              width: width! * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  return Row(
                    children: [
                      // reusable dots indicators sign
                      _customIndicator(
                        index: index,
                        currentIndex: currentPage,
                      ),
                      if (index != 2)
                        const SizedBox(width: 8), // Spacing between indicators
                    ],
                  );
                }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height! * 0.1,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // if page is <=1
                    (currentPage <= 1)
                        ? Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                //  color: Color.fromRGBO(255, 131, 93, 1.0),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // if the currentpage reaches 2 then the button will move to the selection screen
                                    if (currentPage == 2) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Selectionscreen(),
                                        ),
                                      );
                                    } //move to next page
                                    else if (currentPage < 2) {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: height * 0.07,
                                    width: width * 0.58,
                                    decoration: BoxDecoration(
                                        color: Apptheme.mainbackgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width! * 0.19,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "NEXT",
                                            style: GoogleFonts.coiny(
                                              fontSize: width! * 0.055,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width! * 0.12,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: width! * 0.055,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // directly move to the selection screen
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CustomPageTransition(
                                          page: const Selectionscreen()),
                                    );
                                  },
                                  child: SizedBox(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    child: Center(
                                        child: Text(
                                      "Skip",
                                      style: GoogleFonts.coiny(
                                          fontWeight: FontWeight.w500,
                                          color: Apptheme.mainbackgroundcolor,
                                          fontSize: width! * 0.055),
                                    )),
                                  ),
                                )
                              ],
                            ))
                        // if index is 2 then this button will be shown
                        : InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageTransition(
                                    page: const Selectionscreen()),
                              );
                            },
                            child: Container(
                              height: height * 0.07,
                              width: width * 0.58,
                              decoration: BoxDecoration(
                                  color: Apptheme.mainbackgroundcolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width! * 0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "GET STARTED",
                                      style: GoogleFonts.coiny(
                                        fontSize: width! * 0.055,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: width! * 0.055,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  // these are the custom indicator dots

  Widget _customIndicator({
    required int index,
    required int currentIndex,
  }) {
    // Define colors
    Color activeColor = Apptheme.mainbackgroundcolor;
    Color inactiveColor = const Color.fromARGB(255, 198, 198, 198);

    // Define dynamic width
    double activeWidth = 90.0;
    double inactiveWidth = 30.0;

    // Check if the current index matches the indicator index
    Color indicatorColor =
        (index == currentIndex) ? activeColor : inactiveColor;
    double indicatorWidth =
        (index == currentIndex) ? activeWidth : inactiveWidth;
// animate when moved
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Smooth transition
      height: 8.0,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 136, 173),
        ),
      ),
    );
  }
}
