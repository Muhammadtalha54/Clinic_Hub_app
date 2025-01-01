import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/popupdialog/confirmationpopupdialog.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/Appointmentcard.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
/*This screen will show all the user current previous and cancelled appointments

 */
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late double height, width;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      body: Column(
        children: [
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
    );
  }
}
// this takes the list and make the appointmentcards accordingly
// this makes the list  of the appointments
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
        'doctorName': 'Dr. John Doe',
        'specialty': 'Cardiologist',
        'date': '2023-06-15',
        'time': '10:00 AM',
        'id': '76828',
      },
      {
        'doctorName': 'Dr. Jane Smith',
        'specialty': 'Dermatologist',
        'date': '2023-05-20',
        'time': '2:00 PM',
        'id': '76828',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.05,
      ),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return AppointmentCard(
          doctorName: appointment['doctorName']!,
          specialty: appointment['specialty']!,
          date: appointment['date']!,
          time: appointment['time']!,
          status: status,
          doctorimage: 'assets/images/doctor.png',
          bookingid: appointment['id']!,
          cancelbuttonclick: () {
            print("click");
            // Confirmationpopupdialoguebox(
            //   onbuttonpress: () {
            //     Navigator.pop(context);
            //   },
            //   buttoncolor: Apptheme.mainbackgroundcolor,
            //   buttontext: 'Confirm',
            //   dialogbody: 'You want to cancel your appointment with doctor ALi',
            //   dialogtitle: 'Are you sure!',
            // );
            _cancelappointmentconfirmation(context);
          },
        );
      },
    );
  }
// this is a dialog that appers if the user click to cancel the appointment
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
