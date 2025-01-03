import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/Imagewidget.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/profileoptions.dart';

import 'package:clinic_hub_app/Shared_interface/Shared_screens/Privacypolicyscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Userprofile.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/aboutusscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/favouritedoctors.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/previousappointmentsscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Main screen for user profile
class UserAccountscreen extends StatefulWidget {
  const UserAccountscreen({super.key});

  @override
  State<UserAccountscreen> createState() => _UserAccountscreenState();
}

class _UserAccountscreenState extends State<UserAccountscreen> {
  final String? patientname = StaticPatient.patient_model!.Patientname!;

  // imageurl of patientthat is loggedin
  String? patientimageurl = StaticPatient.patient_model!.Patientprofilepicture!;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: width * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 64, 64, 64),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Apptheme.appbodybackgroundcolor),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                ImageUpload(
                  ontap: () {},
                  imageurl: patientimageurl!,
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  child: Text(
                    patientname!,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 73, 73, 73),
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.person_outline,
                  onpressed: () {
                    // print('object');
                    Navigator.of(context).push(
                        CustomPageTransition(page: const Userprofilescreen()));
                    // Navigator.of(context)
                    //     .push(CustomPageTransition(page: Userprofilescreen()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.red,
                  Title: "Profile",
                ),
                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.safety_check_outlined,
                  onpressed: () {
                    Navigator.of(context)
                        .push(CustomPageTransition(page: PrivacyPolicyPage()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.blue,
                  Title: "Privacy Policy",
                ),
                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.safety_check_outlined,
                  onpressed: () {
                    Navigator.of(context)
                        .push(CustomPageTransition(page: AboutUsPage()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.green,
                  Title: "About us",
                ),
                // SizedBox(height: height * 0.01),
                // Profilescreenoptionwidget(
                //   icon: Icons.favorite_outline,
                //   onpressed: () {
                //     Navigator.of(context)
                //         .push(CustomPageTransition(page: const FavoriteDoctors()));
                //   },
                //   height: height * 0.07,
                //   width: width * 0.8,
                //   iconcolor: Colors.amber,
                //   Title: "Favourites",
                // ),
                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.timer_outlined,
                  onpressed: () {
                    Navigator.of(context).push(CustomPageTransition(
                        page: const AppointmentHistoryScreen()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.deepOrange,
                  Title: "Appointment History ",
                ),

                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.logout,
                  onpressed: () {
                    logout(context);
                    Navigator.of(context)
                        .push(CustomPageTransition(page: const Loginscreen()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.deepOrange,
                  Title: "Logout ",
                ),

                //  _buildTabView(width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys();
    preferences.clear();
    StaticPatient.patient_model = null;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginscreen()));
  }
}
