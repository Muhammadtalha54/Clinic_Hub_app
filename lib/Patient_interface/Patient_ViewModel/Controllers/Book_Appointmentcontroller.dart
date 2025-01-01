import 'package:clinic_hub_app/Shared_interface/shared_models/Appointmentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
// this is the controller for the book appointment functionality used by the patient
class BookAppointment_Controller extends GetxController {
  final GlobalKey<FormState> BookAppointmentFormKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController problemController = TextEditingController();
  // varible to store the selected gender
  RxString selectedGender = ''.obs;

// update gender based on the selection
  void updateGender(String gender) {
    selectedGender.value = gender;
  }

// clears the textfields when not in use
  void clearForm() {
    nameController.clear();
    AgeController.clear();
    problemController.clear();
    selectedGender.value = '';
  }


// 
//  Appointmentmodel BookAppointment() {
//     var id = Uuid();
//     var Appointment = id.v4();
//     return Appointmentmodel(
//       patientid: staticuser.patientid;
     
//     );
//   }



}
