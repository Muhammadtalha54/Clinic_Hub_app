import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/profilewidget.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Doctorprofilescreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Historyscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/scheduleappointment.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/Imagewidget.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/Privacypolicyscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/aboutusscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// account information screen for Doctor profile
class DoctorAccountScreen extends StatefulWidget {
  const DoctorAccountScreen({super.key});

  @override
  State<DoctorAccountScreen> createState() => _DoctorAccountScreenState();
}

class _DoctorAccountScreenState extends State<DoctorAccountScreen> {
  String? doctorname = StaticDoctor.doctormodel?.doctorname ?? 'Unknown Doctor';
  String? doctorimageurl = StaticDoctor.doctormodel?.doctorimageurl ?? '';
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
                  ontap: () {},
                  imageurl: doctorimageurl!,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  child: Text(
                    doctorname!,
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
                    Navigator.of(context).push(CustomPageTransition(
                        page: const Doctorprofilescreen()));
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
                    Navigator.of(context).push(CustomPageTransition(
                        page: const ScheduleAppointmentPage()));
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
                        page: const DoctorAppointmenthistoryscreen()));
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
    StaticDoctor.doctormodel = null;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginscreen()));
  }
}
