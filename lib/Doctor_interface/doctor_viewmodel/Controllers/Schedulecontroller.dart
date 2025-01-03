import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Schedule_model.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScheduleController extends GetxController {
  // Controller for schedule data
  var selectedDays =
      <String>['Sunday', 'Monday'].obs; // List to store selected days
  var startTime = const TimeOfDay(hour: 9, minute: 0).obs;
  var endTime = const TimeOfDay(hour: 17, minute: 0).obs;
  var slotDuration = 30.obs; // Slot duration in minutes
  var isLoading = false.obs; // To show loading indicator
  var isError = false.obs; // Error flag for handling errors
  var errorMessage = ''.obs; // Error message to show
  var isSuccess = false.obs; // To trigger the success dialog

  // Doctor ID (static value, replace with dynamic if needed)
  String? doctorId = StaticDoctor.doctormodel!.doctorid;

  DoctorScheduleController(this.doctorId);

  // Update schedule function

  Future<void> updateSchedule() async {
    try {
      isLoading = true.obs;

      print(StaticDoctor.doctormodel!.doctorid);
      print('function executed');
      final querySnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('Doctoremail',
              isEqualTo: StaticDoctor.doctormodel!.Doctoremail)
          .get();

      final docRef = querySnapshot.docs.first.reference.collection('schedule').doc(
          'availability'); // 'availability' is the document where schedule is stored

      // Check if the document already exists
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        print('already');
        // If the schedule exists, update the existing document
        await docRef.update({
          'days': selectedDays,
          'startTime': {
            'hour': startTime.value.hour,
            'minute': startTime.value.minute
          },
          'endTime': {
            'hour': endTime.value.hour,
            'minute': endTime.value.minute
          },
          'slotDuration': slotDuration.value,
        });
        isLoading.value = false;
        isSuccess.value = true; // Indicating the update was successful
      } else {
        print('not already');
        // If no schedule exists, create a new document
        await docRef.set({
          'days': selectedDays,
          'startTime': {
            'hour': startTime.value.hour,
            'minute': startTime.value.minute
          },
          'endTime': {
            'hour': endTime.value.hour,
            'minute': endTime.value.minute
          },
          'slotDuration': slotDuration.value,
        });
        ReusableDialog.show(
          Get.context!,
          title: "Schedule updated sucessfully",
          content: "Your schedule was updated sucessfully",
          buttonText: "OK",
        );
        isSuccess.value =
            true; // Indicating the document was created successfully
      }
    } catch (error) {
      // If an error occurs during the update
      isError.value = true;
      errorMessage.value = error.toString();

      // Show error dialog
      ReusableDialog.show(
        Get.context!,
        title: "Network Error",
        content: "Please check your internet connection and try again.",
        buttonText: "OK",
      );
    } finally {
      // Hide loading indicator
      isLoading.value = false;
    }
  }
}
//   Future<void> updateSchedule() async {
//     try {isLoading = true.obs;
      
//       print(StaticDoctor.doctormodel!.doctorid);
//       print('function executed');
//       final docRef = FirebaseFirestore.instance
//           .collection('doctors')
//           .doc(StaticDoctor.doctormodel!.doctorid)
//           .collection('schedule')
//           .doc(
//               'availability'); // 'availability' is the document where schedule is stored

//       // Check if the document already exists
//       final docSnapshot = await docRef.get();

//       if (docSnapshot.exists) {
//         print('already');
//         // If the schedule exists, update the existing document
//         await docRef.update({
//           'days': selectedDays,
//           'startTime': {
//             'hour': startTime.value.hour,
//             'minute': startTime.value.minute
//           },
//           'endTime': {
//             'hour': endTime.value.hour,
//             'minute': endTime.value.minute
//           },
//           'slotDuration': slotDuration.value,
//         });
//         isLoading.value=false;
//         isSuccess.value = true; // Indicating the update was successful
//       } else {
//         print('not already');
//         // If no schedule exists, create a new document
//         await docRef.set({
//           'days': selectedDays,
//           'startTime': {
//             'hour': startTime.value.hour,
//             'minute': startTime.value.minute
//           },
//           'endTime': {
//             'hour': endTime.value.hour,
//             'minute': endTime.value.minute
//           },
//           'slotDuration': slotDuration.value,
//         });
//         isSuccess.value =
//             true; // Indicating the document was created successfully
//       }
//     } catch (e) {
//       isError.value = true; // If there's an error, show the error message
//       errorMessage.value = e.toString();
//     }
//   }
// }
