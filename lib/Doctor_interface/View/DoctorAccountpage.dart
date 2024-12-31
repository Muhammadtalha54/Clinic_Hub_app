import 'package:clinic_hub_app/Doctor_interface/Resources/Components/profilewidget.dart';
import 'package:clinic_hub_app/Doctor_interface/View/Doctorprofilescreen.dart';
import 'package:clinic_hub_app/Doctor_interface/View/Historyscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/View/scheduleappointment.dart';
import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/User_interface/Resources/Components/widgets/Imagewidget.dart';
import 'package:clinic_hub_app/User_interface/View/Privacypolicyscreen.dart';
import 'package:clinic_hub_app/User_interface/View/aboutusscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

// account information screen for Doctor profile
class DoctorAccountScreen extends StatefulWidget {
  const DoctorAccountScreen({super.key});

  @override
  State<DoctorAccountScreen> createState() => _DoctorAccountScreenState();
}

class _DoctorAccountScreenState extends State<DoctorAccountScreen> {
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
                    "Dr.ALi khan",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 73, 73, 73),
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: height * 0.01),
                // this is a reusable widget to make options
                Doctorprofilewidget(
                  icon: Icons.person_outline,
                  onpressed: () {
                    // print('object');
                    Navigator.of(context).push(
                        CustomPageTransition(page: Doctorprofilescreen()));
                    // Navigator.of(context)
                    //     .push(CustomPageTransition(page: Userprofilescreen()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.red,
                  Title: "Profile",
                ),
                SizedBox(height: height * 0.01),
                Doctorprofilewidget(
                  icon: Icons.timer_outlined,
                  onpressed: () {
                    Navigator.of(context).push(
                        CustomPageTransition(page: ScheduleAppointmentPage()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.green,
                  Title: "Schedule Appointments",
                ),
                SizedBox(height: height * 0.01),
                Doctorprofilewidget(
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
                Doctorprofilewidget(
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

                Doctorprofilewidget(
                  icon: Icons.timer_outlined,
                  onpressed: () {
                    Navigator.of(context).push(CustomPageTransition(
                        page: DoctorAppointmenthistoryscreen()));
                  },
                  height: height * 0.07,
                  width: width * 0.8,
                  iconcolor: Colors.deepOrange,
                  Title: "Appointment History ",
                ),

                SizedBox(height: height * 0.01),
                Doctorprofilewidget(
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
