// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


extension TimeOfDayExtension on TimeOfDay {
  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  static TimeOfDay fromMap(Map<String, dynamic> map) {
    return TimeOfDay(
      hour: map['hour'] as int,
      minute: map['minute'] as int,
    );
  }
}

class ScheduleAppointmentmodel {
List<String>? selectedDays;
  TimeOfDay? startTime;
   TimeOfDay? endTime;
   int? slotDuration;
   String? doctorid;
   String? doctorname;
  ScheduleAppointmentmodel({
    this.selectedDays,
    this.startTime,
    this.endTime,
    this.slotDuration,
    this.doctorid,
    this.doctorname,
  });


  ScheduleAppointmentmodel copyWith({
    List<String>? selectedDays,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? slotDuration,
    String? doctorid,
    String? doctorname,
  }) {
    return ScheduleAppointmentmodel(
      selectedDays: selectedDays ?? this.selectedDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      slotDuration: slotDuration ?? this.slotDuration,
      doctorid: doctorid ?? this.doctorid,
      doctorname: doctorname ?? this.doctorname,);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedDays': selectedDays,
      'startTime': startTime?.toMap(),
      'endTime': endTime?.toMap(),
      'slotDuration': slotDuration,
      'doctorid': doctorid,
      'doctorname': doctorname,
    };
  }

  factory ScheduleAppointmentmodel.fromMap(Map<String, dynamic> map) {
    return ScheduleAppointmentmodel(
      selectedDays: map['selectedDays'] != null ? List<String>.from(map['selectedDays'] as List<String>) : null,
        startTime: map['startTime'] != null ? TimeOfDayExtension.fromMap(map['startTime'] as Map<String, dynamic>) : null,
      endTime: map['endTime'] != null ? TimeOfDayExtension.fromMap(map['endTime'] as Map<String, dynamic>) : null,
      slotDuration: map['slotDuration'] != null ? map['slotDuration'] as int : null,
      doctorid: map['doctorid'] != null ? map['doctorid'] as String : null,
      doctorname: map['doctorname'] != null ? map['doctorname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleAppointmentmodel.fromJson(String source) => ScheduleAppointmentmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScheduleAppointmentmodel(selectedDays: $selectedDays, startTime: $startTime, endTime: $endTime, slotDuration: $slotDuration, doctorid: $doctorid, doctorname: $doctorname)';
  }

  @override
  bool operator ==(covariant ScheduleAppointmentmodel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.selectedDays, selectedDays) &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.slotDuration == slotDuration &&
      other.doctorid == doctorid &&
      other.doctorname == doctorname;
  }

  @override
  int get hashCode {
    return selectedDays.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      slotDuration.hashCode ^
      doctorid.hashCode ^
      doctorname.hashCode;
  }
}
