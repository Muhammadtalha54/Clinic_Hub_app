import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_resources/Components/Appointmentcard.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/AppointmentRequestscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/DetailsAppointment.dart';
import 'package:clinic_hub_app/Doctor_interface/Doctor_screens/Notificationsscreen.dart';
import 'package:clinic_hub_app/Doctor_interface/doctor_viewmodel/Controllers/Appointmentcontroller.dart';
import 'package:clinic_hub_app/Shared_interface/Shared_resources/components/reusabeldialog.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      body: Center(
        child: SizedBox(
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
                name: StaticDoctor.doctormodel!.doctorname!,
                imageurl: StaticDoctor.doctormodel!.doctorimageurl,
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
                    // Upcoming Appointments
                    AppointmentList(
                        status: 'Pending', height: height, width: width),
                    // Completed Appointments
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

  Widget _myCustomheader(
      {required String name,
      required double Notifications_count,
      required String? imageurl,
      required VoidCallback ontap}) {
    return Container(
      height: height * 0.07,
      width: width,
      decoration: const BoxDecoration(),
      child: ListTile(
        leading: imageurl != null && imageurl.isNotEmpty
            ? CircleAvatar(
                radius: width * 0.06,
                backgroundColor: const Color.fromARGB(255, 114, 0, 0),
                backgroundImage: NetworkImage(imageurl))
            : CircleAvatar(
                radius: width * 0.06,
                backgroundColor: const Color.fromARGB(255, 114, 0, 0),
              ),
        title: Text(
          'Hi, $name',
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
      AppointmentsController controller, String bookingId) {
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
    final controller = Get.put<AppointmentsController>(
      AppointmentsController(),
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
                  return Appointmentcarddoctorpanel(
                    PatientName: appointment.patientname!,
                    Patientproblem: appointment.Patientproblem!,
                    cancellationreason: appointment.canellationreason!,
                    date: appointment.date!,
                    time: appointment.time!,
                    status: widget.status,
                    Patientimage: appointment.Patientimageurl ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvj3m7aqQbQp6jX0EGDRWLGNok8H47-XZnfQ&s',
                    bookingid: appointment.bookingid!,
                    cancelbuttonclick: () async {
                      _cancelAppointmentConfirmation(
                          context, controller, appointment.bookingid!);
                    },
                    completebutton: () async {
                      controller.completeAppointment(
                          context, appointment.bookingid!);
                      // Add complete appointment functionality here if needed
                    },
                  );
                },
              ),
            );
    });
  }
}
