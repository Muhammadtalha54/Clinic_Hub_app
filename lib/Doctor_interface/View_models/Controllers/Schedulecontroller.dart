// Controller for managing schedule appointment state
import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleAppointmentController extends GetxController {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final selectedDays = <String>[].obs;
  final startTime = TimeOfDay.now().obs;
  final endTime = TimeOfDay.now().obs;
  final slotDuration = 30.obs;
  final List<int> slotDurations = [15, 30, 45, 60];

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
      } else {
        endTime.value = picked;
      }
    }
  }

  // Function to toggle day selection
  void toggleDaySelection(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }
}
