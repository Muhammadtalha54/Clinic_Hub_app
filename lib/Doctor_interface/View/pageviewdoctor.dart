import 'package:clinic_hub_app/Doctor_interface/View_models/Controllers/Doctorpageviewcontroller.dart';
import 'package:clinic_hub_app/User_interface/View_models/Controllers/pageview_controller.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// this is the page contining the bottom navigation bar and the list of pags to display thorugh the controller

class Doctor_panel_pageview extends StatefulWidget {
  const Doctor_panel_pageview({super.key});

  @override
  State<Doctor_panel_pageview> createState() => _Doctor_panel_pageviewState();
}

class _Doctor_panel_pageviewState extends State<Doctor_panel_pageview> {
  final Doctorpageviewcontroller pageviewController =
      Get.put(Doctorpageviewcontroller());
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        bottomNavigationBar: Obx(() => SizedBox(
              height: height * 0.08,
              child: SalomonBottomBar(
                backgroundColor: const Color.fromARGB(243, 255, 255, 255),
                currentIndex: pageviewController.selectedIndex.value,
                onTap: pageviewController.changePage,
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home_outlined, size: width * 0.068),
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    selectedColor: Apptheme.mainbackgroundcolor,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.schedule, size: width * 0.068),
                    title: Text(
                      "Appointment Requests",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    selectedColor: Apptheme.mainbackgroundcolor,
                  ),
                  // SalomonBottomBarItem(
                  //   icon: Icon(Icons.medical_services_outlined,
                  //       size: width * 0.068),
                  //   title: Text(
                  //     "Appointment Requests",
                  //     style: TextStyle(fontSize: width * 0.04),
                  //   ),
                  //   selectedColor: Apptheme.mainbackgroundcolor,
                  // ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.person_outline, size: width * 0.068),
                    title: Text(
                      "My Account",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    selectedColor: Apptheme.mainbackgroundcolor,
                  ),
                ],
              ),
            )),
        body: Obx(
          () =>
              pageviewController.pages[pageviewController.selectedIndex.value],
        ));
  }
}
