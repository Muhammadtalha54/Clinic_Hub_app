// ignore_for_file: public_member_api_docs, sort_constructors_first

// this is the model for the appointments will be used by both the doctor and the patient
import 'dart:convert';

class Appointmentmodel {
  String? doctorName;
  String? doctorid;
  String? specialty;
  String? date;
  String? time;
  String? Appointmentstatus;
  String? doctorimageurl;
  String? bookingid;
  String? patientname;
  String? Patientimageurl;
  String? Patientproblem;
  String? patientid;
  String? canellationreason;
  Appointmentmodel({
    this.doctorName,
    this.doctorid,
    this.specialty,
    this.date,
    this.time,
    this.Appointmentstatus,
    this.doctorimageurl,
    this.bookingid,
    this.patientname,
    this.Patientimageurl,
    this.Patientproblem,
    this.patientid,
    this.canellationreason,
  });
 

  Appointmentmodel copyWith({
    String? doctorName,
    String? doctorid,
    String? specialty,
    String? date,
    String? time,
    String? Appointmentstatus,
    String? doctorimageurl,
    String? bookingid,
    String? patientname,
    String? Patientimageurl,
    String? Patientproblem,
    String? patientid,
    String? canellationreason,
  }) {
    return Appointmentmodel(
      doctorName: doctorName ?? this.doctorName,
      doctorid: doctorid ?? this.doctorid,
      specialty: specialty ?? this.specialty,
      date: date ?? this.date,
      time: time ?? this.time,
      Appointmentstatus: Appointmentstatus ?? this.Appointmentstatus,
      doctorimageurl: doctorimageurl ?? this.doctorimageurl,
      bookingid: bookingid ?? this.bookingid,
      patientname: patientname ?? this.patientname,
      Patientimageurl: Patientimageurl ?? this.Patientimageurl,
      Patientproblem: Patientproblem ?? this.Patientproblem,
      patientid: patientid ?? this.patientid,
      canellationreason: canellationreason ?? this.canellationreason,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctorName': doctorName,
      'doctorid': doctorid,
      'specialty': specialty,
      'date': date,
      'time': time,
      'Appointmentstatus': Appointmentstatus,
      'doctorimageurl': doctorimageurl,
      'bookingid': bookingid,
      'patientname': patientname,
      'Patientimageurl': Patientimageurl,
      'Patientproblem': Patientproblem,
      'patientid': patientid,
      'canellationreason': canellationreason,
    };
  }

  factory Appointmentmodel.fromMap(Map<String, dynamic> map) {
    return Appointmentmodel(
      doctorName: map['doctorName'] != null ? map['doctorName'] as String : null,
      doctorid: map['doctorid'] != null ? map['doctorid'] as String : null,
      specialty: map['specialty'] != null ? map['specialty'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      Appointmentstatus: map['Appointmentstatus'] != null ? map['Appointmentstatus'] as String : null,
      doctorimageurl: map['doctorimageurl'] != null ? map['doctorimageurl'] as String : null,
      bookingid: map['bookingid'] != null ? map['bookingid'] as String : null,
      patientname: map['patientname'] != null ? map['patientname'] as String : null,
      Patientimageurl: map['Patientimageurl'] != null ? map['Patientimageurl'] as String : null,
      Patientproblem: map['Patientproblem'] != null ? map['Patientproblem'] as String : null,
      patientid: map['patientid'] != null ? map['patientid'] as String : null,
      canellationreason: map['canellationreason'] != null ? map['canellationreason'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointmentmodel.fromJson(String source) => Appointmentmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointmentmodel(doctorName: $doctorName, doctorid: $doctorid, specialty: $specialty, date: $date, time: $time, Appointmentstatus: $Appointmentstatus, doctorimageurl: $doctorimageurl, bookingid: $bookingid, patientname: $patientname, Patientimageurl: $Patientimageurl, Patientproblem: $Patientproblem, patientid: $patientid, canellationreason: $canellationreason)';
  }

  @override
  bool operator ==(covariant Appointmentmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.doctorName == doctorName &&
      other.doctorid == doctorid &&
      other.specialty == specialty &&
      other.date == date &&
      other.time == time &&
      other.Appointmentstatus == Appointmentstatus &&
      other.doctorimageurl == doctorimageurl &&
      other.bookingid == bookingid &&
      other.patientname == patientname &&
      other.Patientimageurl == Patientimageurl &&
      other.Patientproblem == Patientproblem &&
      other.patientid == patientid &&
      other.canellationreason == canellationreason;
  }

  @override
  int get hashCode {
    return doctorName.hashCode ^
      doctorid.hashCode ^
      specialty.hashCode ^
      date.hashCode ^
      time.hashCode ^
      Appointmentstatus.hashCode ^
      doctorimageurl.hashCode ^
      bookingid.hashCode ^
      patientname.hashCode ^
      Patientimageurl.hashCode ^
      Patientproblem.hashCode ^
      patientid.hashCode ^
      canellationreason.hashCode;
  }
}
