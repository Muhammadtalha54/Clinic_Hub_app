import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/requestcomponent.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/Myrequesscreen.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/My_requestwidget.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientRequestsscreen extends StatefulWidget {
  const PatientRequestsscreen({super.key});

  @override
  State<PatientRequestsscreen> createState() => _PatientRequestsscreenState();
}

class _PatientRequestsscreenState extends State<PatientRequestsscreen> {
  final MyRequestscontroller _controller = Get.put(MyRequestscontroller());
  var height, width;
  @override
  void initState() {
    super.initState();
    // Fetch doctors when the screen is initialized
    _controller.fetchMyRequests();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // Get the controller

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
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
        if (_controller.myAppointmentRequests.isEmpty) {
          return const Center(child: Text('No appointment requests found.'));
        }

        // Otherwise, display the list of requests
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: _controller.myAppointmentRequests.length,
            itemBuilder: (context, index) {
              final request = _controller.myAppointmentRequests[index];

              return MyAppointmentwidget(
                doctorName: request.doctorName!,
                date: request.date!,
                time: request.time.toString(),
                reason: request.Patientproblem!,
                onReject: () {
                  // Handle reject logic
                  _controller.deleteAppointment(request.bookingid!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Appointment with ${request.doctorName!} deleted."),
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
