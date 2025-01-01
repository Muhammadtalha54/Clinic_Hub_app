import 'dart:async';

import 'package:flutter/material.dart';

/* this is the page that will be displayed to the doctor when he/she
 has sent the joinig request this will display the status of the doctor
 application wether it is accepted or not and show options based on the status of
 application
*/

class DoctorRequeststatus extends StatefulWidget {
  const DoctorRequeststatus({super.key});

  @override
  State<DoctorRequeststatus> createState() => _DoctorRequeststatusState();
}

class _DoctorRequeststatusState extends State<DoctorRequeststatus> {
  @override
  String _status = 'pending';
  var height, width;

  @override
  void initState() {
    super.initState();
    // Simulate status change after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _status = 'rejected';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.9,
          child: Card(
            elevation: 7,
            margin: EdgeInsets.all(height * 0.02),
            child: Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: width * 0.06,
                  ),
                  SizedBox(height: height * 0.02),
                  const Text(
                    'Application Submitted',
                    style: TextStyle(),
                  ),
                  SizedBox(height: height * 0.02),
                  const Text(
                    'Thank you for signing up as a doctor.',
                  ),
                  SizedBox(height: height * 0.02),
                  _buildStatusWidget(),
                  SizedBox(height: height * 0.02),
                  Text(
                    _getStatusDescription(),
                    textAlign: TextAlign.center,
                    //style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: height * 0.03),

                  // ),
                  SizedBox(width: height * 0.02),

                  ElevatedButton.icon(
                    icon: (_status == 'approved')
                        ? const Icon(Icons.login, color: Colors.white)
                        : (_status == 'rejected')
                            ? const Icon(Icons.cancel_outlined, color: Colors.red)
                            : const Icon(Icons.watch_later_rounded,
                                color: Colors.white), // Icon color
                    label: (_status == 'approved')
                        ? const Text(
                            'Log In',
                            style: TextStyle(color: Colors.white), // Text color
                          )
                        : (_status == 'rejected')
                            ? const Text(
                                'Rejected',
                                style:
                                    TextStyle(color: Colors.red), // Text color
                              )
                            : const Text(
                                'Please wait',
                                style: TextStyle(
                                    color: Colors.white), // Text color
                              ),
                    onPressed: () {
                      // Navigate to login page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      minimumSize: Size(width * 0.4,
                          height * 0.06), // Button width and height
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget() {
    IconData icon;
    Color color;
    String text;

    switch (_status) {
      case 'pending':
        icon = Icons.access_time;
        color = Colors.orange;
        text = 'Application Pending';
        break;
      case 'approved':
        icon = Icons.check_circle;
        color = Colors.green;
        text = 'Application Approved';
        break;
      case 'rejected':
        icon = Icons.cancel;
        color = Colors.red;
        text = 'Application Rejected';
        break;
      default:
        icon = Icons.error;
        color = Colors.grey;
        text = 'Unknown Status';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _getStatusDescription() {
    switch (_status) {
      case 'pending':
        return 'Your application is currently under review. We\'ll notify you once it\'s approved.';
      case 'approved':
        return 'Congratulations! Your application has been approved. You can now log in to your account.';
      case 'rejected':
        return 'We\'re sorry, but your application has been rejected. Please contact support for more information.';
      default:
        return '';
    }
  }
}
