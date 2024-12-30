import 'package:flutter/material.dart';
// this is the widget in which the appointment requests will be displayed
class AppointmentRequestCard extends StatelessWidget {
  final String patientName;
  final String date;
  final String time;
  final String reason;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const AppointmentRequestCard({
    super.key,
    required this.patientName,
    required this.date,
    required this.time,
    required this.reason,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
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
              "Patient: $patientName",
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
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onAccept,
                  child: Text(
                    "Accept",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onReject,
                  child: Text(
                    "Reject",
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
