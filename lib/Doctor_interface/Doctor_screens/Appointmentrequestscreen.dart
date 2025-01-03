import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/requestcomponent.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../doctor_viewmodel/Controllers/Requestappointmentcontroller.dart';

class AppointmentRequestsPage extends StatefulWidget {
  const AppointmentRequestsPage({super.key});

  @override
  State<AppointmentRequestsPage> createState() =>
      _AppointmentRequestsPageState();
}

class _AppointmentRequestsPageState extends State<AppointmentRequestsPage> {
  final AppointmentRequestcontroller _controller =
      Get.put(AppointmentRequestcontroller());

  @override
  void initState() {
    super.initState();
    // Fetch doctors when the screen is initialized
    _controller.fetchDoctorRequests();
  }

  @override
  Widget build(BuildContext context) {
    // Get the controller

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          "Appointment Requests",
          style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        // Show loading indicator while fetching data
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // If no appointment requests, show a message
        if (_controller.Appointmentrequests.isEmpty) {
          return const Center(child: Text('No appointment requests found.'));
        }

        // Otherwise, display the list of requests
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: _controller.Appointmentrequests.length,
            itemBuilder: (context, index) {
              final request = _controller.Appointmentrequests[index];
              return AppointmentRequestCard(
                patientName: request.patientname!,
                date: request.date!,
                time: request.time.toString(),
                reason: request.Patientproblem!,
                onAccept: () {
                  _controller.acceptAppointment(context, request.bookingid!);
                  // Handle accept logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Appointment with ${request.patientname!} accepted."),
                    ),
                  );
                },
                onReject: () {
                  // Handle reject logic
                  _controller.deleteAppointment(request.bookingid!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Appointment with ${request.patientname!} rejected."),
                    ),
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}
