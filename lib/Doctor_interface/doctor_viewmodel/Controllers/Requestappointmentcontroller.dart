import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/Shared_interface/shared_models/Appointmentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppointmentRequestcontroller extends GetxController {
  // Reactive variables
  RxList<Appointmentmodel> Appointmentrequests = <Appointmentmodel>[].obs;
  var requests = <Map<String, dynamic>>[].obs; // List of request data
  var doctorName = ''.obs;
  var isLoading = false.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    // Fetch doctor name from static model
    doctorName.value = StaticDoctor.doctormodel!.doctorname!;
    fetchDoctorRequests();
  }

  // Fetch all doctor requests from Firestore
  Future<void> fetchDoctorRequests() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore
          .collection('appointment_request')
          .where('doctorName', isEqualTo: doctorName.value)
          .get(); // Fetch all documents that match the doctorName

      if (snapshot.docs.isNotEmpty) {
        requests.clear(); // Clear any previous request data
        for (var doc in snapshot.docs) {
          // Add request data to the list
          //  re  for (var user in query.docs) {
          Appointmentmodel model =
              Appointmentmodel.fromMap(doc.data() as Map<String, dynamic>);
          Appointmentrequests.add(model);
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

  Appointmentmodel createAppointment(
      Appointmentmodel selectedDoctor,
      String patientId,
      String patientName,
      String bookingid,
      String problemDescription,
      String selectedDate,
      String selectedSlot) {
    return Appointmentmodel(
        doctorid: selectedDoctor.doctorid, // Assuming the doctor has an ID
        doctorName: selectedDoctor.doctorName,
        patientid: patientId,
        Appointmentstatus: 'pending',
        patientname: patientName,
        doctorimageurl: selectedDoctor.doctorimageurl,
        bookingid: bookingid,
        Patientproblem: problemDescription,
        date: selectedDate,
        specialty: selectedDoctor.specialty,
        requeststatus: 'pending',
        time: selectedSlot,
        canellationreason: '');
  }
  // Delete a doctor request by document ID

  Future<void> acceptAppointment(BuildContext context, String bookingId) async {
    try {
      // ReusableDialog.show(
      //    context,
      //   title: "Are you sure",
      //   content: 'your App',
      //   buttonText: 'OK',
      // );
      var appointmentRequest = Appointmentrequests.firstWhere(
          (request) => request.bookingid == bookingId);

      // Add to approved_appointments
      await _firestore.collection('Appointments').add({
        'doctorid': appointmentRequest.doctorid,
        'doctorName': appointmentRequest.doctorName,
        'patientid': appointmentRequest.patientid,
        'Appointmentstatus': 'Pending', // Updated status when accepted
        'patientname': appointmentRequest.patientname,
        'doctorimageurl': appointmentRequest.doctorimageurl,
        'bookingid': appointmentRequest.bookingid,
        'Patientproblem': appointmentRequest.Patientproblem,
        'date': appointmentRequest.date,
        'specialty': appointmentRequest.specialty,
        'requeststatus': 'approved', // Updated status when accepted
        'time': appointmentRequest.time,
        'canellationreason': appointmentRequest.canellationreason,

        // Add other fields as necessary
      });


      // Remove from appointment_request
      await _firestore
          .collection('appointment_request')
          .doc(bookingId)
          .delete();
  ReusableDialog.show(
         context,
        title: "Appointment request Accepted",
        content: 'your appointment request has been accepted',
        buttonText: 'OK',
      );
      // Remove from local list
      Appointmentrequests.removeWhere(
          (request) => request.bookingid == bookingId);
    } catch (e) {
      print("Error accepting appointment: $e");
    }
  }

  // Delete appointment request from Firestore
  Future<void> deleteAppointment(String bookingId) async {
    try {
      await _firestore
          .collection('appointment_request')
          .doc(bookingId)
          .delete();

      // Remove from local list
      Appointmentrequests.removeWhere(
          (request) => request.bookingid == bookingId);
    } catch (e) {
      print("Error deleting appointment: $e");
    }
  }
}
