import 'package:flutter/material.dart';
// this is the appointment card that is shown on the appointment screen

class Appointmentcarddoctorpanel extends StatefulWidget {
  final String PatientName;
  final String Patientproblem;
  final String date;
  final String time;
  final String status;
  final String Patientimage;
  final String cancellationreason;
  final String bookingid;
  final VoidCallback cancelbuttonclick;

  final VoidCallback completebutton;
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
    required this.completebutton,
    required this.cancellationreason,
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
                  widget.Patientimage != null
                      ? Container(
                          height: height * 0.18,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(139, 77, 73, 13),
                              // color: Colors.grey.shade50,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(widget.Patientimage),
                                  fit: BoxFit.fitHeight)),
                        )
                      : Container(
                          height: height * 0.18,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(139, 77, 73, 13),
                            // color: Colors.grey.shade50,
                            shape: BoxShape.circle,
                          ),
                        ),
                  SizedBox(
                    height: height * 0.5,
                    width: width * 0.5,
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
                          overflow: TextOverflow.ellipsis,
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
                        if (widget.status == 'cancelled')
                          Text(
                            maxLines: 2,
                            'Reason: \n${widget.cancellationreason}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),

                        if (widget.status == 'Pending')
                          SizedBox(
                              height: height * 0.035,
                              width: width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          193,
                                          79,
                                          196,
                                          238), // Button background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Border radius
                                      ),
                                    ),
                                    onPressed: widget.completebutton,
                                    child: Text(
                                      'Completed',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: width * 0.03),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          193,
                                          79,
                                          196,
                                          238), // Button background color
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
                                          fontSize: width * 0.03),
                                    ),
                                  ),
                                ],
                              )),
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
