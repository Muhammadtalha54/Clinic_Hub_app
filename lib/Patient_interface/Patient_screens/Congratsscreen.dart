import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*WHen the user will sucessfully book an appointment 
then he will navigate to this screen showing a 
confirmation note
 */
class Congratsscreen extends StatelessWidget {
  final String doctorName;
  final String appointmentTime;
  final String appointmentDate;
  final String patientName;

  const Congratsscreen({super.key, 
    required this.doctorName,
    required this.appointmentTime,
    required this.appointmentDate,
    required this.patientName,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Defining text styles and sizes as variables for reuse

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: const Text('Appointment Booked'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Message at the top

              Icon(
                Icons.task_alt_outlined,
                size: width * 0.4,
                color: Colors.green,
              ),
              SizedBox(
                height: height * 0.1,
                width: width * 0.8,
                child: Text(
                  'Your appointment has been booked!',
                  style: GoogleFonts.coiny(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.03),

              // Appointment details card
              Card(
                elevation: 5,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor: $doctorName',
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Patient: $patientName',
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Appointment Date: $appointmentDate',
                        style: TextStyle(fontSize: width * 0.045),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Appointment Time: $appointmentTime',
                        style: TextStyle(fontSize: width * 0.045),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),

              // Go to Home Screen Button
              ElevatedButton(
                onPressed: () {
                  // Add your navigation logic here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.8, height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Apptheme.mainbackgroundcolor),
                child: Text(
                  'Go to Home Screen',
                  style:
                      TextStyle(fontSize: width * 0.045, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
