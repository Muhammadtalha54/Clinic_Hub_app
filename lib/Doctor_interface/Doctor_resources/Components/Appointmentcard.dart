import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/popupdialog/confirmationpopupdialog.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
// this is the appointment card that is shown on the appointment screen

class Appointmentcarddoctorpanel extends StatefulWidget {
  final String PatientName;
  final String Patientproblem;
  final String date;
  final String time;
  final String status;
  final String Patientimage;
  final String bookingid;
  final VoidCallback cancelbuttonclick;

  const Appointmentcarddoctorpanel({
    super.key,
    required this.PatientName,
    required this.Patientproblem,
    required this.date,
    required this.time,
    required this.status,
    required this.Patientimage,
    required this.bookingid,
    required this.cancelbuttonclick,
  });

  @override
  _AppointmentcarddoctorpanelState createState() =>
      _AppointmentcarddoctorpanelState();
}

class _AppointmentcarddoctorpanelState
    extends State<Appointmentcarddoctorpanel> {
  //bool _showReview = false;
  // int _rating = 0;
  // String _review = '';

  // void _handleSubmitReview() {
  //   print('Rating: $_rating, Review: $_review');
  //   setState(() {
  //     _showReview = false;
  //     _rating = 0;
  //     _review = '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: height * 0.02),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
              width: width * 0.87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${widget.date}",
                    style: TextStyle(
                        fontSize: width * 0.042, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Time: ${widget.time}",
                    style: TextStyle(
                        fontSize: width * 0.042, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: height * 0.23,
              width: width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.18,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(139, 77, 73, 13),
                        // color: Colors.grey.shade50,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.Patientimage ??
                                'assets/images/doctor.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(
                    height: height * 0.5,
                    width: width * 0.4,
                    //  color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.PatientName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        //  SizedBox(height: height * 0.005),
                        Text(
                          'Patientproblem: ${widget.Patientproblem}',
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500),
                        ),
                        // Text('Date: ${widget.date}'),
                        // Text('Time: ${widget.time}'),
                        SizedBox(height: height * 0.01),

                        Text(
                          'Status: ${widget.status[0].toUpperCase() + widget.status.substring(1)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.status == 'pending'
                                ? Colors.orange
                                : widget.status == 'completed'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'Booking ID: #${widget.bookingid}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: height * 0.01,
                        ),
                        if (widget.status == 'pending')
                          SizedBox(
                            height: height * 0.048,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(193, 79,
                                    196, 238), // Button background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12), // Border radius
                                ),
                              ),
                              onPressed: widget.cancelbuttonclick,
                              child: Text(
                                'Cancel ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: width * 0.036),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //all these values will be get from the database
            SizedBox(height: height * 0.02),
            if (widget.status == 'cancelled')
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      141, 79, 195, 238), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Block Patient',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.033),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
