import 'package:clinic_hub_app/Patient_interface/Patient_screens/Alldoctorsscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Appointmentsscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Homescreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/MyAccountscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// this is the controller that changes pages on the click of 
//the bottom navigation bar of the patient panel
class Page_View_controller extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> pages = [
    const Patient_homescreen(),
    const AppointmentScreen(),
    const All_Doctors_list_screen(),
    const UserAccountscreen()
  ];

  void changePage(int index) {
    selectedIndex.value = index; // Update the selected index
  }
}
