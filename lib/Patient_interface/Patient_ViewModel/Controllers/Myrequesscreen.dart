import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/shared_models/Appointmentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyRequestscontroller extends GetxController {
  // Reactive variables
  RxList<Appointmentmodel> myAppointmentRequests = <Appointmentmodel>[].obs;
  var requests = <Map<String, dynamic>>[].obs; // List of request data
  var PatientId = ''.obs;
  var isLoading = false.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    // Fetch doctor name from static model
    PatientId.value = StaticPatient.patient_model!.PatientId!;
    fetchMyRequests();
  }

  // Fetch all doctor requests from Firestore
  Future<void> fetchMyRequests() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore
          .collection('appointment_request')
          .where('patientid', isEqualTo: PatientId.value)
          .get(); // Fetch all documents that match the doctorName

      if (snapshot.docs.isNotEmpty) {
        requests.clear(); // Clear any previous request data
        for (var doc in snapshot.docs) {
          // Add request data to the list
          //  re  for (var user in query.docs) {
          Appointmentmodel model =
              Appointmentmodel.fromMap(doc.data() as Map<String, dynamic>);
          myAppointmentRequests.clear();
          myAppointmentRequests.add(model);
        }
      } else {
        requests.clear(); // If no documents, clear the list
      }
    } catch (e) {
      print('Error fetching requests: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete appointment request from Firestore
  Future<void> deleteAppointment(String bookingId) async {
    try {
      final snapshot = await _firestore
          .collection('appointment_request')
          .where('bookingid', isEqualTo: bookingId)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      // Remove from local list
      myAppointmentRequests
          .removeWhere((request) => request.bookingid == bookingId);
      await fetchMyRequests();
    } catch (e) {
      print("Error deleting appointment: $e");
    }
  }
}
