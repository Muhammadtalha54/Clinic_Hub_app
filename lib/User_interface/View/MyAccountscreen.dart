import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/Imagewidget.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/profileoptions.dart';

import 'package:clinic_hub_app/User_interface/View/Privacypolicyscreen.dart';
import 'package:clinic_hub_app/User_interface/View/Userprofile.dart';
import 'package:clinic_hub_app/User_interface/View/aboutusscreen.dart';
import 'package:clinic_hub_app/User_interface/View/favouritedoctors.dart';
import 'package:clinic_hub_app/User_interface/View/previousappointmentsscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

// Main screen for user profile
class UserAccountscreen extends StatefulWidget {
  const UserAccountscreen({super.key});

  @override
  State<UserAccountscreen> createState() => _UserAccountscreenState();
}

class _UserAccountscreenState extends State<UserAccountscreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
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
                  imageurl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s',
                  ontap: () {
                    // Navigator.of(context)
                    //     .push(CustomPageTransition(page: Userprofilescreen()));
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  child: Text(
                    "ALi khan",
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
                    Navigator.of(context)
                        .push(CustomPageTransition(page: Userprofilescreen()));
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
                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.favorite_outline,
                  onpressed: () {
                    Navigator.of(context)
                        .push(CustomPageTransition(page: FavoriteDoctors()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.amber,
                  Title: "Favourites",
                ),
                SizedBox(height: height * 0.01),
                Profilescreenoptionwidget(
                  icon: Icons.timer_outlined,
                  onpressed: () {
                    Navigator.of(context).push(
                        CustomPageTransition(page: AppointmentHistoryScreen()));
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
                    Navigator.of(context)
                        .push(CustomPageTransition(page: Loginscreen()));
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
}
