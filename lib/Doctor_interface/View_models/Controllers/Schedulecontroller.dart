import 'package:clinic_hub_app/Doctor_interface/Models/Schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
  // Make sure you import the ScheduleAppointment class

class ScheduleAppointmentController extends GetxController {
  final List<String> daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  
  // List of selected days and other necessary states
  final selectedDays = <String>[].obs;
  final startTime = TimeOfDay.now().obs;
  final endTime = TimeOfDay.now().obs;
  final slotDuration = 30.obs;
  
  // Available slot durations
  final List<int> slotDurations = [15, 30, 45, 60];
  
  // Create an instance of ScheduleAppointment
  ScheduleAppointment schedule = ScheduleAppointment(
    selectedDays: [],  // Initially empty
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay.now(),
    slotDuration: 30,
  );
  
  // Function to select time using a time picker
  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime.value : endTime.value,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Apptheme.mainbackgroundcolor,
            colorScheme: ColorScheme.light(
              primary: Apptheme.mainbackgroundcolor,
              secondary: Apptheme.mainbackgroundcolor,
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      if (isStartTime) {
        startTime.value = picked;
        schedule = schedule.copyWith(startTime: picked); // Update the schedule
      } else {
        endTime.value = picked;
        schedule = schedule.copyWith(endTime: picked); // Update the schedule
      }
    }
  }

  // Function to toggle day selection
  void toggleDaySelection(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
      schedule = schedule.copyWith(selectedDays: selectedDays); // Update the schedule
    } else {
      selectedDays.add(day);
      schedule = schedule.copyWith(selectedDays: selectedDays); // Update the schedule
    }
  }

  // Function to change the slot duration
  void changeSlotDuration(int newDuration) {
    slotDuration.value = newDuration;
    schedule = schedule.copyWith(slotDuration: newDuration); // Update the schedule
  }
  
  // Function to get the current schedule data as a map (useful for saving to database)
  Map<String, dynamic> getScheduleMap() {
    return schedule.toMap(); // Convert the schedule to a map
  }

  // Function to reset the schedule data
  void resetSchedule() {
    schedule = schedule.copyWith(
      selectedDays: [],
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      slotDuration: 30,
    );
    selectedDays.clear();
    startTime.value = TimeOfDay.now();
    endTime.value = TimeOfDay.now();
    slotDuration.value = 30;
  }
}
