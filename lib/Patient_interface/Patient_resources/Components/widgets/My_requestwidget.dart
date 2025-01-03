import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';

// this is the widget in which the appointment requests will be displayed
class MyAppointmentwidget extends StatelessWidget {
  final String doctorName;
  final String date;
  final String time;
  final String reason;

  final VoidCallback onReject;

  const MyAppointmentwidget({
    super.key,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.reason,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      elevation: 5,
      margin: EdgeInsets.only(bottom: height * 0.02),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.035,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Doctor: $doctorName",
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Date: $date",
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.005),
            Text(
              "Time: $time",
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.015),
            Text(
              "Reason: $reason",
              style: TextStyle(
                fontSize: width * 0.037,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Apptheme.mainbackgroundcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onReject,
                  child: Text(
                    "Withdraw",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
