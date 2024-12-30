import 'package:clinic_hub_app/Initialscreens/loginsignup/components/Selectoptioncars.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Doctorsignupscreen.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Initialscreens/loginsignup/screens/Usersignupscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* This is the screen where the user will select that either he want to make a
doctor profile or a user profile so that they can access thier features
*/
class Selectionscreen extends StatefulWidget {
  const Selectionscreen({super.key});

  @override
  State<Selectionscreen> createState() => _SelectionscreenState();
}

class _SelectionscreenState extends State<Selectionscreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Apptheme.mainbackgroundcolor,
      body: Center(
        child: SizedBox(
          height: height,
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: height * 0.2,
              // ),
              Container(
                height: height * 0.85,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(107, 231, 231, 231)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      "Welcome to the \nClinic Hub",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: width * 0.06,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // this is a reusable widget to make a card  for patient
                    Selectoptionscard(
                      Optiontitle: "For Patients",
                      Optionmessage:
                          "Access your health records and book appointments",
                      buttontext: "Sign Up as Patient",
                      height: height * 0.25,
                      width: width * 0.8,
                      buttoncolor: Colors.blue,
                      titlecolor: Colors.blue,
                      //navigated to the
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomPageTransition(page: const Usersignupscreen()),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // card for doctor
                    Selectoptionscard(
                      Optiontitle: "For Doctors",
                      Optionmessage: "Manage your practice and patient records",
                      buttontext: "Sign Up as Doctor",
                      height: height * 0.25,
                      width: width * 0.8,
                      buttoncolor: Colors.green,
                      titlecolor: Colors.green,
                      // parameter value
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomPageTransition(
                            page: const Doctorsignupscreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.white, fontSize: width * 0.04),
                          ),
                          // if already have an account then login
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageTransition(page: const Loginscreen()),
                              );
                            },
                            child: Text(
                              " Log in",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 123, 254),
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
