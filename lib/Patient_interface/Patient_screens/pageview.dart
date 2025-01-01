import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/pageview_controller.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
/*This is the main page where all the other pages are displayed and a
bottom navigation bar is used for the accessing the pages
 */
class Patient_panel_pageview extends StatefulWidget {
  const Patient_panel_pageview({super.key});

  @override
  State<Patient_panel_pageview> createState() => _Patient_panel_pageviewState();
}

class _Patient_panel_pageviewState extends State<Patient_panel_pageview> {
  final Page_View_controller pageviewController =
      Get.put(Page_View_controller());
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
                      "Appointments",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    selectedColor: Apptheme.mainbackgroundcolor,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.medical_services_outlined,
                        size: width * 0.068),
                    title: Text(
                      "Doctors",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    selectedColor: Apptheme.mainbackgroundcolor,
                  ),
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
