import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/selectionscreen.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Usersignupscreen.dart';
import 'package:clinic_hub_app/Initialscreens/onboarding/pageviewscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.mainbackgroundcolor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: height!,
              width: width,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: const [
                  Obscreens(
                      ImagePath: "assets/images/img1.png",
                      textTitle: "Discover Trusted Doctors",
                      TextMessage:
                          "Browse detailed profiles and reviews to find the right doctor for your needs."),
                  Obscreens(
                      ImagePath: "assets/images/img1.png",
                      textTitle: " Seamless Appointment Booking",
                      TextMessage:
                          "Book appointments quickly and conveniently with our easy-to-use interface"),
                  Obscreens(
                      ImagePath: "assets/images/img1.png",
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
                                    if (currentPage == 2) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Selectionscreen(),
                                        ),
                                      );
                                    } else if (currentPage < 2) {
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
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
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
                                                  255, 4, 21, 178),
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
                                              255, 5, 27, 171),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                     Navigator.of(context).push(
                                CustomPageTransition(page: Selectionscreen()),
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
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: width! * 0.055),
                                    )),
                                  ),
                                )
                              ],
                            ))
                        : InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageTransition(page: Selectionscreen()),
                              );
                            },
                            child: Container(
                              height: height * 0.07,
                              width: width * 0.58,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                                            255, 46, 74, 167),
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

  Widget _customIndicator({
    required int index,
    required int currentIndex,
  }) {
    // Define colors
    Color activeColor = const Color.fromARGB(255, 255, 255, 255);
    Color inactiveColor = const Color.fromARGB(44, 158, 158, 158);

    // Define dynamic width
    double activeWidth = 90.0;
    double inactiveWidth = 30.0;

    // Check if the current index matches the indicator index
    Color indicatorColor =
        (index == currentIndex) ? activeColor : inactiveColor;
    double indicatorWidth =
        (index == currentIndex) ? activeWidth : inactiveWidth;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Smooth transition
      height: 8.0,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 200, 200, 200),
        ),
      ),
    );
  }
}
