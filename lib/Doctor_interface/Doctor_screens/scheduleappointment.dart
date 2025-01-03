import 'package:clinic_hub_app/Doctor_interface/Doctor_models/Staticmodel.dart';
import 'package:clinic_hub_app/Doctor_interface/doctor_viewmodel/Controllers/Schedulecontroller.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  const ScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  late final DoctorScheduleController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DoctorScheduleController(
        StaticDoctor.doctormodel!.doctorid.toString()));
  }

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    final initialTime =
        isStartTime ? controller.startTime.value : controller.endTime.value;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Apptheme.mainbackgroundcolor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor:
                    Apptheme.appbodybackgroundcolor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      if (isStartTime) {
        controller.startTime.value = pickedTime;
      } else {
        controller.endTime.value = pickedTime;
      }
    }
  }

  void dispose() {
    super.dispose();

    Get.delete<DoctorScheduleController>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Apptheme.appbodybackgroundcolor,
      appBar: AppBar(
        backgroundColor: Apptheme.appbodybackgroundcolor,
        title: Text(
          'Schedule Availability',
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: height,
          width: width * 0.9,
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(children: [
              SizedBox(
                width: width * 0.85,
                child: Text(
                  'Select Available Days:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: height * 0.03),
              Obx(() => Wrap(
                    spacing: 15.0, // Space between chips
                    children: [
                      for (var day in [
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday',
                        'Sunday',
                      ])
                        ChoiceChip(
                          label: Text(day),
                          selected: controller.selectedDays.contains(day),
                          onSelected: (selected) {
                            if (selected) {
                              controller.selectedDays
                                  .add(day); // Add selected day
                            } else {
                              controller.selectedDays
                                  .remove(day); // Remove unselected day
                            }
                          },
                          backgroundColor:
                              Colors.grey[300], // Default background color
                          selectedColor: Apptheme
                              .mainbackgroundcolor, // Background color when selected
                          labelStyle: TextStyle(
                            color: controller.selectedDays.contains(day)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                    ],
                  )),
              SizedBox(height: height * 0.04),
              SizedBox(
                width: width * 0.85,
                child: Text(
                  'Select Available Time:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: SizedBox(
                          height: height * 0.07,
                          width: width * 0.4,
                          child: Center(
                            child: Text(
                              'Start Time: ${controller.startTime.value.format(context)}',
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickTime(context, true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Apptheme.mainbackgroundcolor, // Background color
                          //  onPrimary: Colors.white, // Text color
                          minimumSize: Size(
                              width * 0.2, height * 0.07), // Width and height
                          elevation: 5, // Shadow elevation
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Set Start Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.035, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: SizedBox(
                          height: height * 0.07,
                          width: width * 0.4,
                          child: Center(
                            child: Text(
                              'End Time: ${controller.endTime.value.format(context)}',
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickTime(context, true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Apptheme.mainbackgroundcolor, // Background color
                          //  onPrimary: Colors.white, // Text color
                          minimumSize: Size(
                              width * 0.2, height * 0.07), // Width and height
                          elevation: 5, // Shadow elevation
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Set End Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.035, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: height * 0.04),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: SizedBox(
                        height: height * 0.07,
                        width: width * 0.4,
                        child: Center(
                          child: Text(
                            'Slot Duration:\n ${controller.slotDuration.value} minutes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      // width: width * 0.2,
                      decoration: BoxDecoration(
                        color: Apptheme.mainbackgroundcolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<int>(
                        elevation: 5,
                        focusColor: Apptheme.mainbackgroundcolor,
                        value: controller.slotDuration.value,
                        items: [15, 30, 45, 60].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              '$value minutes',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.slotDuration.value = value;
                          }
                        },
                        style: TextStyle(color: Colors.black), // Text color
                        dropdownColor: Apptheme
                            .mainbackgroundcolor, // Dropdown background color
                        iconEnabledColor: Colors.black, // Icon color
                        iconDisabledColor: Colors.grey, // Disabled icon color
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => controller.updateSchedule(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Apptheme.mainbackgroundcolor, // Background color
                        //  onPrimary: Colors.white, // Text color
                        minimumSize: Size(
                            width * 0.2, height * 0.07), // Width and height
                        elevation: 5, // Shadow elevation
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Save Availability',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.035, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    )),
              SizedBox(
                height: height * 0.03,
              ),
              Obx(() => controller.isSuccess.value
                  ? const Text('Schedule saved successfully!')
                  : const SizedBox()),
              Obx(() => controller.isError.value
                  ? Text(
                      'Error: ${controller.errorMessage.value}',
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox()),
            ]),
          ),
        ),
      ),
    );
  }
}
