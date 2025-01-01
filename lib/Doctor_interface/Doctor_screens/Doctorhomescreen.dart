import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/Appointmentcard.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Appointmentrequestscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/DetailsAppointment.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Notificationsscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';

// this is the first screen that the doctor panel willhave
class DoctorHomescreen extends StatefulWidget {
  const DoctorHomescreen({super.key});

  @override
  State<DoctorHomescreen> createState() => _DoctorHomescreenState();
}

class _DoctorHomescreenState extends State<DoctorHomescreen>
    with SingleTickerProviderStateMixin {
  var height, width;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      body: Center(
        child: Container(
          height: height,
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              _myCustomheader(
                name: 'Ali Khan',
                ontap: () {
                  Navigator.of(context).push(CustomPageTransition(
                    page: DoctorNotificationscreen(),
                  ));
                },
                Notifications_count: 6,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // Title Section
              Container(
                height: height * 0.1,
                alignment: Alignment.center,
                child: Text(
                  "Appointments",
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Custom TabBar
              Container(
                height: height * 0.07,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Apptheme.mainbackgroundcolor,
                  indicatorWeight: 2.0,
                  labelColor: Apptheme.mainbackgroundcolor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text(
                        "Upcoming",
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Completed",
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Cancelled",
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ),
                  ],
                ),
              ),

              // TabBar Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Current Appointments
                    AppointmentList(
                        status: 'pending', height: height, width: width),
                    // Previous Appointments
                    AppointmentList(
                        status: 'completed', height: height, width: width),
                    // Cancelled Appointments
                    AppointmentList(
                        status: 'cancelled', height: height, width: width),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // this is the top header

  Widget _myCustomheader(
      {required String name,
      required double Notifications_count,
      required VoidCallback ontap}) {
    return Container(
      height: height * 0.07,
      width: width,
      decoration: const BoxDecoration(),
      child: ListTile(
        leading: CircleAvatar(
          radius: width * 0.06,
          backgroundColor: const Color.fromARGB(255, 114, 0, 0),
        ),
        title: Text(
          'Hi, Dr.$name',
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "How are you today?",
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.035,
              fontWeight: FontWeight.normal),
        ),
        trailing: Container(
          height: height * 0.07,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 224, 253),
            borderRadius: BorderRadius.circular(width * 0.07),
          ),
          child: Center(
            child: IconButton(
              icon: Badge.count(
                count: Notifications_count.toInt(),
                child: Icon(
                  Icons.notifications_outlined,
                  size: width * 0.06,
                  color: Colors.grey.shade600,
                ),
              ),
              onPressed: ontap,
            ),
          ),
        ),
      ),
    );
  }
}
// this takes the list and make the appointmentcards accordingly

class AppointmentList extends StatelessWidget {
  final String status;
  final double height;
  final double width;

  const AppointmentList({
    super.key,
    required this.status,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Replace with dynamic data fetching logic
    final appointments = [
      {
        'PatientName': 'Ali ',
        'Patientproblem': 'Heart Problem',
        'date': '2023-06-15',
        'time': '10:00 AM',
        'id': '76828',
        'image': 'assets/images/doctor.png'
      },
      {
        'PatientName': 'Dr. Jane Smith',
        'Patientproblem': 'Dermatologist',
        'date': '2023-05-20',
        'time': '2:00 PM',
        'id': '76828',
        'image': 'assets/images/doctor.png'
      },
    ];

    return Container(
      height: height * 0.6,
      width: width,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
            // vertical: height * 0.01,
            // horizontal: width * 0.02,
            ),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailAppoitmentscreen(
                        appointmentDetails: appointment, index: index),
                  ));
            },
            child: Appointmentcarddoctorpanel(
              PatientName: appointment['PatientName']!,
              Patientproblem: appointment['Patientproblem']!,
              date: appointment['date']!,
              time: appointment['time']!,
              status: status,
              Patientimage: appointment['image']!,
              bookingid: appointment['id']!,
              cancelbuttonclick: () {
                print("click");
                _cancelappointmentconfirmation(context);
              },
            ),
          );
        },
      ),
    );
  }

  void _cancelappointmentconfirmation(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Are you sure?'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Your Appointment will be cancelled.'),
                const SizedBox(height: 10),
                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    labelText: 'Reason for cancellation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please provide a reason for cancellation';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
              ),
              child: const Text(
                'Close',
                style: TextStyle(color: Color.fromARGB(255, 57, 57, 57)),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // Perform the cancellation action
                  final reason = reasonController.text;
                  debugPrint('Cancellation reason: $reason');

                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Apptheme.mainbackgroundcolor,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
