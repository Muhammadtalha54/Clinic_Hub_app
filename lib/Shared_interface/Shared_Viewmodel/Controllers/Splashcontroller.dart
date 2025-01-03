import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/pageviewdoctor.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Usermodel.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/pageview.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_screens/onboarding/onboarding.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _getDataFromSF();
  }

  _getDataFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    String? userType = prefs.getString("usertype");

    if (userId == null || userType == null) {
      // Navigate to login screen if no user data exists
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => const Onboardingscreens());
      });
    } else {
      // Fetch user data from the correct collection based on userType
      QuerySnapshot<Map<String, dynamic>>? query;
      if (userType == 'doctor') {
        // Fetch doctor data from the 'Doctors' collection
        query = await FirebaseFirestore.instance
            .collection("doctors")
            .where("docotrid", isEqualTo: userId)
            .get();
      } else if (userType == 'patient') {
        // Fetch patient data from the 'Patients' collection
        query = await FirebaseFirestore.instance
            .collection("Patients")
            .where("PatientId", isEqualTo: userId)
            .get();
      }

      if (query != null && query.docs.isNotEmpty) {
        if (userType == 'doctor') {
          // Doctor model handling
          Doctor_Model doctorModel = Doctor_Model.fromMap(
              query.docs[0].data() as Map<String, dynamic>);
          StaticDoctor.doctormodel = doctorModel; // Set the doctor model

          // Navigate to the doctor interface after fetching data
          Future.delayed(const Duration(seconds: 3), () {
            Get.offAll(() =>
                const Doctor_panel_pageview()); // Navigate to the doctor page
          });
        } else if (userType == 'patient') {
          // Patient model handling
          Patient_model model = Patient_model.fromMap(
              query.docs[0].data() as Map<String, dynamic>);
          StaticPatient.patient_model = model; // Set the patient model

          // Navigate to the patient interface after fetching data

          Future.delayed(const Duration(seconds: 3), () {
            Get.offAll(() =>
                const Patient_panel_pageview()); // Navigate to the patient page directly
          });
        }
      }
    }
  }
}
