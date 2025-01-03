import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDoctorscontroller extends GetxController {
  RxList<Doctor_Model> allUsers = <Doctor_Model>[].obs;
  RxBool isLoading = false.obs; // Track loading state

  getUsers(BuildContext context) async {
    try {
      isLoading.value = true; // Set loading to true before fetching data

      QuerySnapshot query =
          await FirebaseFirestore.instance.collection('doctors').get();

      if (query.docs.isEmpty) {
        ReusableDialog.show(
          context,
          title: "No doctors found",
          content: "No doctors found",
          buttonText: "OK",
        );
      } else {
        // Clear the existing list before adding new data
        allUsers.clear();
        
        for (var user in query.docs) {
          Doctor_Model model =
              Doctor_Model.fromMap(user.data() as Map<String, dynamic>);
          allUsers.add(model);
        }
      }
    } catch (e) {
      print('Error fetching doctors: $e');
    } finally {
      isLoading.value = false; // Set loading to false after fetching data
    }
  }


  var categories = <String>[
    "All",
    "General Physician",
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Orthopedic",
    "Gynecologist",
    "Dentist",
  ].obs;

 


  // Future<void> getfilteredUsers(BuildContext context) async {
  //   isLoading.value = true;
  //   try {
  //     // Fetch and assign doctors to allUsers
  //     // Example: allUsers.assignAll(await fetchDoctors());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
