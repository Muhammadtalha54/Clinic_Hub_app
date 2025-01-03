import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/AppointmentRequestscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/DoctorAccountpage.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Doctorhomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// the controller for the pages on the doctor pageview
class Doctorpageviewcontroller extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> pages = [
    const DoctorHomescreen(),
    const AppointmentRequestsPage(),
    const DoctorAccountScreen()
  ];

  void changePage(int index) {
    selectedIndex.value = index; // Update the selected index
  }
}
