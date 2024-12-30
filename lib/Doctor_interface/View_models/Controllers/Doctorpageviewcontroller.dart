import 'package:clinic_hub_app/Doctor_interface/View/Appointmentrequestscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/View/DoctorAccountpage.dart';
import 'package:clinic_hub_app/Doctor_interface/View/Doctorhomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// the controller for the pages
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
