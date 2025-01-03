import 'dart:io';

import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/shared_models/Appointmentsmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsController extends GetxController {
  // RxList to store appointments
  var isloading = false.obs;
  var appointments = <Map<String, dynamic>>[].obs;
  RxList<Appointmentmodel> AllAppointments = <Appointmentmodel>[].obs;
  var doctorName = ''.obs;
  @override
  void onInit() {
    super.onInit();
    // Fetch doctor name from static model
    doctorName.value = StaticDoctor.doctormodel!.doctorname!;
    fetchAppointments();
  }

  // Fetch appointments by status
  void fetchAppointments() {
    try {
      isloading = true.obs;
      FirebaseFirestore.instance
          .collection('Appointments')
          .where('doctorName', isEqualTo: doctorName.value)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          AllAppointments.clear(); // Clear any previous data
          for (var doc in snapshot.docs) {
            Appointmentmodel model =
                Appointmentmodel.fromMap(doc.data() as Map<String, dynamic>);
            AllAppointments.add(model); // Add the model to the list
          }
        }
      });
    } on SocketException catch (e) {
      print('No Internet connection: $e');
    } catch (e) {
      print('Error fetching appointments: $e');
    } finally {
      isloading = false.obs;
    }
  }

  // Function to cancel appointment (you can extend it based on your use case)
  Future<void> cancelAppointment(String appointmentId, String reason) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('Appointments')
          .where('bookingid', isEqualTo: appointmentId)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.update({
          'Appointmentstatus': 'cancelled',
          'canellationreason': reason,
        });
      }
      AllAppointments.refresh();
    } catch (e) {
      print('Error canceling appointment: $e');
    }
  }

  void completeAppointment(BuildContext context, String bookingId) async {
    try {
      // Update the Firestore document status to 'Completed'
      var querySnapshot = await FirebaseFirestore.instance
          .collection('Appointments')
          .where('bookingid', isEqualTo: bookingId)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.update({
          'Appointmentstatus': 'completed',
        });
      }

      // After successful update, refresh the appointments list
      AllAppointments.refresh(); // This will notify the UI to update the list

      print('Appointment successfully marked as completed');
      ReusableDialog.show(
        context,
        title: "Appointment Status updated",
        content: 'Appointment is marked as completed',
        buttonText: 'OK',
      );
    } catch (e) {
      print('Error completing appointment: $e');
    }
  }
}
