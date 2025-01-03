import 'package:clinic_hub_app/Patient_interface/Patient_ViewModel/Controllers/Appointmentscontroller.dart';
import 'package:clinic_hub_app/Patient_interface/Patient_resources/Components/widgets/Appointmentcard.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
// this takes the list and make the appointmentcards accordingly
class AppointmentList extends StatefulWidget {
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
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final TextEditingController reasonController = TextEditingController();

  void _cancelAppointmentConfirmation(BuildContext context,
      PatientAppointmentController controller, String bookingId) {
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
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final reason = reasonController.text;

                  // Call the controller's cancellation method
                  controller.cancelAppointment(bookingId, reason);

                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
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

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<PatientAppointmentController>(
      PatientAppointmentController(),
    );

    return Obx(() {
      final filteredAppointments = controller.AllAppointments.where(
              (appointment) => appointment.Appointmentstatus == widget.status)
          .toList();

      return filteredAppointments.isEmpty
          ? Center(child: Text("No ${widget.status} appointments"))
          : SizedBox(
              height: widget.height * 0.6,
              width: widget.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: widget.height * 0.01,
                  horizontal: widget.width * 0.02,
                ),
                itemCount: filteredAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = filteredAppointments[index];
                  return AppointmentCardPatient(
                    doctorName: appointment.doctorName!,
                    //     Patientproblem: appointment.Patientproblem!,
                    cancellationreason: appointment.canellationreason!,
                    date: appointment.date!,
                    time: appointment.time!,
                    status: widget.status,
                    doctorimage: appointment.doctorimageurl ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvj3m7aqQbQp6jX0EGDRWLGNok8H47-XZnfQ&s',
                    bookingid: appointment.bookingid!,
                    cancelbuttonclick: () async {
                      _cancelAppointmentConfirmation(
                          context, controller, appointment.bookingid!);
                    },
                    completebutton: () async {
                      controller.completeAppointment(
                          context, appointment.bookingid!);
                      // Add complee appointment functionality here if needed
                    },
                    specialty: appointment.specialty!,
                    reviewbuttonclick: () {},
                  );
                },
              ),
            );
    });
  }
}
