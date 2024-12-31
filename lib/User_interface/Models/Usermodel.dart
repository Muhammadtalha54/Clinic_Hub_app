// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Patient_model {
  String? PatientId;
  String? Patientname;
  String? PatientEmail;
  String? Patientdob;
  String? Patientpassword;

  String? Patientphonenumber;
  String? Patientprofilepicture;
  Patient_model({
    this.PatientId,
    this.Patientname,
    this.PatientEmail,
    this.Patientdob,
    this.Patientpassword,
    this.Patientphonenumber,
    this.Patientprofilepicture,
  });


  Patient_model copyWith({
    String? PatientId,
    String? Patientname,
    String? PatientEmail,
    String? Patientdob,
    String? Patientpassword,
    String? Patientphonenumber,
    String? Patientprofilepicture,
  }) {
    return Patient_model(
      PatientId: PatientId ?? this.PatientId,
      Patientname: Patientname ?? this.Patientname,
      PatientEmail: PatientEmail ?? this.PatientEmail,
      Patientdob: Patientdob ?? this.Patientdob,
      Patientpassword: Patientpassword ?? this.Patientpassword,
      Patientphonenumber: Patientphonenumber ?? this.Patientphonenumber,
      Patientprofilepicture: Patientprofilepicture ?? this.Patientprofilepicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PatientId': PatientId,
      'Patientname': Patientname,
      'PatientEmail': PatientEmail,
      'Patientdob': Patientdob,
      'Patientpassword': Patientpassword,
      'Patientphonenumber': Patientphonenumber,
      'Patientprofilepicture': Patientprofilepicture,
    };
  }

  factory Patient_model.fromMap(Map<String, dynamic> map) {
    return Patient_model(
      PatientId: map['PatientId'] != null ? map['PatientId'] as String : null,
      Patientname: map['Patientname'] != null ? map['Patientname'] as String : null,
      PatientEmail: map['PatientEmail'] != null ? map['PatientEmail'] as String : null,
      Patientdob: map['Patientdob'] != null ? map['Patientdob'] as String : null,
      Patientpassword: map['Patientpassword'] != null ? map['Patientpassword'] as String : null,
      Patientphonenumber: map['Patientphonenumber'] != null ? map['Patientphonenumber'] as String : null,
      Patientprofilepicture: map['Patientprofilepicture'] != null ? map['Patientprofilepicture'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient_model.fromJson(String source) => Patient_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient_model(PatientId: $PatientId, Patientname: $Patientname, PatientEmail: $PatientEmail, Patientdob: $Patientdob, Patientpassword: $Patientpassword, Patientphonenumber: $Patientphonenumber, Patientprofilepicture: $Patientprofilepicture)';
  }

  @override
  bool operator ==(covariant Patient_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.PatientId == PatientId &&
      other.Patientname == Patientname &&
      other.PatientEmail == PatientEmail &&
      other.Patientdob == Patientdob &&
      other.Patientpassword == Patientpassword &&
      other.Patientphonenumber == Patientphonenumber &&
      other.Patientprofilepicture == Patientprofilepicture;
  }

  @override
  int get hashCode {
    return PatientId.hashCode ^
      Patientname.hashCode ^
      PatientEmail.hashCode ^
      Patientdob.hashCode ^
      Patientpassword.hashCode ^
      Patientphonenumber.hashCode ^
      Patientprofilepicture.hashCode;
  }
}
