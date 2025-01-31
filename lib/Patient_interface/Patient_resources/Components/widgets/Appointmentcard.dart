// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// this is the appointment card that is shown on the appointment screen

class AppointmentCardPatient extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String status;
  final String doctorimage;
  final String bookingid;
  final String cancellationreason;
  final VoidCallback cancelbuttonclick;
  final VoidCallback reviewbuttonclick;

  const AppointmentCardPatient({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.status,
    required this.doctorimage,
    required this.bookingid,
    required this.cancellationreason,
    required this.cancelbuttonclick,
    required this.reviewbuttonclick, required Future<Null> Function() completebutton,
  }) : super(key: key);

  @override
  _AppointmentCardPatientState createState() => _AppointmentCardPatientState();
}

class _AppointmentCardPatientState extends State<AppointmentCardPatient> {
  bool _showReview = false;
  int _rating = 0;
  String _review = '';

  void _handleSubmitReview() {
    
    print('Rating: $_rating, Review: $_review');
    setState(() {
      _showReview = false;
      _rating = 0;
      _review = '';
    });
  }

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
            vertical: height * 0.02, horizontal: width * 0.035),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
              width: width * 0.8,
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
              height: height * 0.2,
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.18,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(139, 77, 73, 13),
                        // color: Colors.grey.shade50,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.doctorimage ??
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
                          widget.doctorName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        //  SizedBox(height: height * 0.005),
                        Text(
                          'Specialty: ${widget.specialty}',
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
                        if(widget.status=='cancelled')
                          Text(
                            
                            maxLines: 2,
                          'Reason: \n#${widget.cancellationreason}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600),
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
            if (!_showReview && widget.status == 'completed')
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      141, 79, 195, 238), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                ),
                onPressed: () => setState(() => _showReview = true),
                child: Text(
                  'Give Review',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.033),
                ),
              ),
            if (_showReview)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () => setState(() => _rating = index + 1),
                      );
                    }),
                  ),
                  TextField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Write your review here...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => _review = value),
                  ),
                  SizedBox(height: height * 0.01),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          141, 79, 195, 238), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Border radius
                      ),
                    ),
                    onPressed: widget.reviewbuttonclick,
                    child: Text(
                      'Submit Review',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.03),
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
