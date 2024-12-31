import 'package:clinic_hub_app/Doctor_interface/View_models/Controllers/Schedulecontroller.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// View for scheduling appointments
class ScheduleAppointmentPage extends StatefulWidget {
  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  final ScheduleAppointmentController controller =
      Get.put(ScheduleAppointmentController());

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
        child: Container(
          height: height,
          width: width * 0.9,
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(children: [
              Container(
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
                    spacing: width * 0.02,
                    children: controller.daysOfWeek.map((day) {
                      return ChoiceChip(
                        elevation: 10,
                        backgroundColor:
                            const Color.fromARGB(255, 219, 239, 255),
                        selectedColor: Apptheme.mainbackgroundcolor,
                        disabledColor: const Color.fromARGB(255, 171, 248, 255),
                        label: Text(
                          day,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: controller.selectedDays.contains(day)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: controller.selectedDays.contains(day),
                        onSelected: (selected) {
                          controller.toggleDaySelection(day);
                        },
                      );
                    }).toList(),
                  )),
              SizedBox(height: height * 0.04),
              Container(
                width: width * 0.85,
                child: Text(
                  'Select Available Time:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Obx(() => Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Container(
                                height: height * 0.07,
                                width: width * 0.4,
                                child: Center(
                                  child: Text(
                                    'Start Time: ${controller.startTime.value.format(context)}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Apptheme.mainbackgroundcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => controller.selectTime(context, true),
                          child: Text(
                            'Start Time',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.035,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Obx(() => Container(
                    width: width * 0.85,
                    height: height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Container(
                                height: height * 0.07,
                                width: width * 0.4,
                                child: Center(
                                  child: Text(
                                    'End Time: ${controller.endTime.value.format(context)}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Apptheme.mainbackgroundcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () =>
                              controller.selectTime(context, false),
                          child: Text(
                            'End Time',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.035,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                          height: height * 0.07,
                          width: width * 0.4,
                          child: Center(
                            child: Obx(() => Text(
                                  'Slot: ${controller.slotDuration.value} minutes',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500),
                                )),
                          ))),
                  Card(
                    elevation: 5,
                    color: Apptheme.mainbackgroundcolor,
                    child: Container(
                      width: width * 0.3,
                      child: Center(
                        child: Obx(() => DropdownButton<int>(
                              dropdownColor: Apptheme.mainbackgroundcolor,
                              value: controller.slotDuration.value,
                              items: controller.slotDurations.map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    '  $value minutes',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                controller.slotDuration.value = newValue!;
                              },
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Apptheme.mainbackgroundcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  print('Selected Days: ${controller.selectedDays}');
                  print(
                      'Start Time: ${controller.startTime.value.format(context)}');
                  print(
                      'End Time: ${controller.endTime.value.format(context)}');
                  print(
                      'Slot Duration: ${controller.slotDuration.value} minutes');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.transparent,
                    content: Text(
                      'Schedule set from ${controller.startTime.value.format(context)} to ${controller.endTime.value.format(context)} on ${controller.selectedDays.join(", ")} with slot duration of ${controller.slotDuration.value} minutes.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ));
                },
                child: Text(
                  'Save Availability',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.035,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
