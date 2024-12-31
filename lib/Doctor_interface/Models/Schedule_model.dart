import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleAppointment {
  final List<String> selectedDays;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int slotDuration;

  ScheduleAppointment({
    required this.selectedDays,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
  });

  @override
  String toString() {
    return 'Selected Days: ${selectedDays.join(', ')}\n'
        'Start Time: ${startTime.format(Get.context!)}\n'
        'End Time: ${endTime.format(Get.context!)}\n'
        'Slot Duration: $slotDuration minutes';
  }

  ScheduleAppointment copyWith({
    List<String>? selectedDays,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? slotDuration,
  }) {
    return ScheduleAppointment(
      selectedDays: selectedDays ?? this.selectedDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      slotDuration: slotDuration ?? this.slotDuration,
    );
  }

  // Convert ScheduleAppointment instance to a map
  Map<String, dynamic> toMap() {
    return {
      'selectedDays': selectedDays,
      'startTime': startTime.toFormattedString(), // Store formatted time as String
      'endTime': endTime.toFormattedString(), // Store formatted time as String
      'slotDuration': slotDuration,
    };
  }

  // Create ScheduleAppointment from a map
  static ScheduleAppointment fromMap(Map<String, dynamic> map) {
    return ScheduleAppointment(
      selectedDays: List<String>.from(map['selectedDays']),
      startTime: TimeOfDayExtension.fromFormattedString(map['startTime']),
      endTime: TimeOfDayExtension.fromFormattedString(map['endTime']),
      slotDuration: map['slotDuration'],
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  // Convert TimeOfDay to a formatted string (e.g., "14:30")
  String toFormattedString() {
    return '${this.hour.toString().padLeft(2, '0')}:${this.minute.toString().padLeft(2, '0')}';
  }

  // Create TimeOfDay from a formatted string (e.g., "14:30")
  static TimeOfDay fromFormattedString(String timeString) {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
