import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/requestcomponent.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
// Import the reusable component
// this is the screen on which the user appointment requests will be displayed
class AppointmentRequestsPage extends StatefulWidget {
  const AppointmentRequestsPage({super.key});

  @override
  State<AppointmentRequestsPage> createState() =>
      _AppointmentRequestsPageState();
}

class _AppointmentRequestsPageState extends State<AppointmentRequestsPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    final List<Map<String, String>> appointmentRequests = [
      {
        "patientName": "John Doe",
        "date": "2024-01-15",
        "time": "10:00 AM",
        "reason": "Follow-up for flu symptoms",
      },
      {
        "patientName": "Jane Smith",
        "date": "2024-01-16",
        "time": "11:30 AM",
        "reason": "Consultation for skin allergy",
      },
    ];

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          "Appointment Requests",
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600),
        ),
        // primary: false,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: height,
          width: width * 0.9,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: appointmentRequests.length,
            itemBuilder: (context, index) {
              final request = appointmentRequests[index];
              return AppointmentRequestCard(
                patientName: request["patientName"]!,
                date: request["date"]!,
                time: request["time"]!,
                reason: request["reason"]!,
                onAccept: () {
                  // Handle accept logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Appointment with ${request["patientName"]} accepted."),
                    ),
                  );
                },
                onReject: () {
                  // Handle reject logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Appointment with ${request["patientName"]} rejected."),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
