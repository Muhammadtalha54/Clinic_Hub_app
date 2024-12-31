import 'package:clinic_hub_app/Shared_screens/View/loginsignup/screens/Loginscreen.dart';
import 'package:clinic_hub_app/User_interface/View/Alldoctorsscreen.dart';
import 'package:clinic_hub_app/User_interface/View/Appointmentsscreen.dart';
import 'package:clinic_hub_app/User_interface/View/Homescreen.dart';
import 'package:clinic_hub_app/User_interface/View/MyAccountscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
