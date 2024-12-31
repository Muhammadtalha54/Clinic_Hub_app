import 'package:clinic_hub_app/Shared_screens/Resources/components/customtextfield.dart';
import 'package:clinic_hub_app/User_interface/View/Congratsscreen.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:clinic_hub_app/apptheme/apptransitions/customtransition.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController problemcontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String selectedSlot = '';
  String patientName = '';
  String patientAge = '';
  String patientGender = 'Male';
  String problemDescription = '';

  List<DateTime> getDates() {
    List<DateTime> dates = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 30; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    return dates;
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  void dispose() {
    super.dispose();
    Namecontroller.dispose();
    agecontroller.dispose();
    problemcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final dates = getDates();
    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text('Book Appointment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(
                height: height * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    DateTime date = dates[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                          print(selectedDate);
                        });
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.02),
                        ),
                        color: isSameDate(selectedDate, date)
                            ? Apptheme.mainbackgroundcolor
                            : Colors.white,
                        child: Container(
                          height: height * 0.12,
                          width: width * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              color: Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('dd').format(date),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSameDate(selectedDate, date)
                                        ? const Color.fromARGB(
                                            255, 250, 250, 250)
                                        : const Color.fromARGB(255, 84, 84, 84),
                                    fontSize: width * 0.045,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text(
                                  DateFormat('EEE').format(date),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: isSameDate(selectedDate, date)
                                        ? const Color.fromARGB(
                                            255, 250, 250, 250)
                                        : const Color.fromARGB(255, 84, 84, 84),
                                    fontSize: width * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Available Slots',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.2,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.4),
                  itemCount: ((8 * 60) / 30)
                      .toInt(), // 8 hours * 60 minutes / 30 minutes interval
                  itemBuilder: (context, index) {
                    DateTime slotTime = DateTime(selectedDate.year,
                            selectedDate.month, selectedDate.day, 9, 0)
                        .add(Duration(minutes: index * 30));
                    String slot = DateFormat.jm().format(slotTime);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSlot = slot;
                        });
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.015)),
                        color: selectedSlot == slot
                            ? Apptheme.mainbackgroundcolor
                            : Colors.white,
                        child: Container(
                            height: height * 0.04,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.015)),
                            child: Center(
                                child: Text(
                              slot,
                              style: TextStyle(
                                  color: selectedSlot == slot
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w500),
                            ))),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Patient Details',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: width * 0.045,
                ),
              ),
              CustomTextFormField(
                  isEditing: true,
                  controller: Namecontroller,
                  label: 'Name',
                  hintText: "Name",
                  errorMessage: "Enter a valid name"),
              CustomTextFormField(
                  isEditing: true,
                  controller: Namecontroller,
                  label: 'Age',
                  hintText: "Enter your age",
                  errorMessage: "Enter valid Age"),
              SizedBox(height: height * 0.02),
              Text(
                'Gender',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: width * 0.045,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: patientGender,
                      onChanged: (value) {
                        setState(() {
                          patientGender = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: patientGender,
                      onChanged: (value) {
                        setState(() {
                          patientGender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Problem Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: width * 0.04,
                ),
              ),
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Describe your problem',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    problemDescription = value;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              Center(
                child: Container(
                  height: height * 0.07,
                  width: width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        backgroundColor: Apptheme.mainbackgroundcolor),
                    onPressed: () {
                      _bookappointmentconfirmation(context);
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _bookappointmentconfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Are you sure to book this Appointment?',
            style:
                TextStyle(color: Color.fromARGB(255, 79, 78, 78), fontSize: 20),
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
                Navigator.of(context).push(CustomPageTransition(
                  page: Congratsscreen(
                    doctorName: 'Dr. Smith',
                    appointmentTime: '10:00 AM',
                    appointmentDate: '2024-12-30',
                    patientName: 'John Doe',
                  ),
                ));

                ; // Close the dialog
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
