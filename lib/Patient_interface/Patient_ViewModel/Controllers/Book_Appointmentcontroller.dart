import 'package:clinic_hub_app/Patient_interface/Patient_models/Staticmodel.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_screens/Congratsscreen.dart';
import 'package:clinic_hub_app/Shared_interface/shared_models/Appointmentsmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Doctor_model.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Appointmentrequestcontroller {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Method to create appointment request
  Future<void> createAppointmentRequest(
      {required BuildContext context,
      required Doctor_Model selectedDoctor,
      required String selectedDate,
      required String selectedSlot,
      required String problemDescription,
      String? patientage,
      String? patientgender}) async {
    // Get patient details from static model (can be fetched dynamically if needed)
    String patientName = StaticPatient.patient_model!.Patientname!;
    String patientId = StaticPatient.patient_model!.PatientId!;
    String patientImageUrl =
        StaticPatient.patient_model!.Patientprofilepicture!;

    var id = const Uuid();
    var bookingid = id.v4();

    // Create AppointmentRequestModel object with user inputs
    Appointmentmodel appointment = Appointmentmodel(
        doctorid: selectedDoctor.doctorid, // Assuming the doctor has an ID
        doctorName: selectedDoctor.doctorname,
        patientid: patientId,
        Appointmentstatus: 'pending',
        patientname: patientName,
        doctorimageurl: selectedDoctor.doctorimageurl,
        bookingid: bookingid,
        Patientproblem: problemDescription,
        date: selectedDate,
        specialty: selectedDoctor.doctorspecialization,
        requeststatus: 'pending',
        time: selectedSlot,
        canellationreason: '');

    try {
      // Add the appointment request to Firestore under 'appointmentrequest' collection
      await _firebaseFirestore
          .collection('appointment_request')
          .add(appointment.toMap());

      // Navigate to a confirmation screen (or any other screen you'd like)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Congratsscreen(
                  doctorName: selectedDoctor.doctorname!,
                  patientName: StaticPatient.patient_model!.Patientname!,
                  appointmentTime: selectedSlot,
                  appointmentDate: selectedDate,
                )),
      );
    } catch (e) {
      // Handle errors (e.g., show a snackbar)
      print('Error creating appointment: $e');
    }
  }
}
