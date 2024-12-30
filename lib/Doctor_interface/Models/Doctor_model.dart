// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Doctor_Model {
  String? doctorname;
  String? doctorid;
  String? doctorage;
  String? doctorspecialization;
  String? doctorimageurl;
  String? doctordescription;
  String? doctorlisencenumber;
  String? doctorlisenceimageurl;
  String? doctorexperience;
  int? totalappointmentstalen;
  Doctor_Model({
    this.doctorname,
    this.doctorid,
    this.doctorage,
    this.doctorspecialization,
    this.doctorimageurl,
    this.doctordescription,
    this.doctorlisencenumber,
    this.doctorlisenceimageurl,
    this.doctorexperience,
    this.totalappointmentstalen,
  });

  Doctor_Model copyWith({
    String? doctorname,
    String? doctorid,
    String? doctorage,
    String? doctorspecialization,
    String? doctorimageurl,
    String? doctordescription,
    String? doctorlisencenumber,
    String? doctorlisenceimageurl,
    String? doctorexperience,
    int? totalappointmentstalen,
  }) {
    return Doctor_Model(
      doctorname: doctorname ?? this.doctorname,
      doctorid: doctorid ?? this.doctorid,
      doctorage: doctorage ?? this.doctorage,
      doctorspecialization: doctorspecialization ?? this.doctorspecialization,
      doctorimageurl: doctorimageurl ?? this.doctorimageurl,
      doctordescription: doctordescription ?? this.doctordescription,
      doctorlisencenumber: doctorlisencenumber ?? this.doctorlisencenumber,
      doctorlisenceimageurl:
          doctorlisenceimageurl ?? this.doctorlisenceimageurl,
      doctorexperience: doctorexperience ?? this.doctorexperience,
      totalappointmentstalen:
          totalappointmentstalen ?? this.totalappointmentstalen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctorname': doctorname,
      'doctorid': doctorid,
      'doctorage': doctorage,
      'doctorspecialization': doctorspecialization,
      'doctorimageurl': doctorimageurl,
      'doctordescription': doctordescription,
      'doctorlisencenumber': doctorlisencenumber,
      'doctorlisenceimageurl': doctorlisenceimageurl,
      'doctorexperience': doctorexperience,
      'totalappointmentstalen': totalappointmentstalen,
    };
  }

  factory Doctor_Model.fromMap(Map<String, dynamic> map) {
    return Doctor_Model(
      doctorname:
          map['doctorname'] != null ? map['doctorname'] as String : null,
      doctorid: map['doctorid'] != null ? map['doctorid'] as String : null,
      doctorage: map['doctorage'] != null ? map['doctorage'] as String : null,
      doctorspecialization: map['doctorspecialization'] != null
          ? map['doctorspecialization'] as String
          : null,
      doctorimageurl: map['doctorimageurl'] != null
          ? map['doctorimageurl'] as String
          : null,
      doctordescription: map['doctordescription'] != null
          ? map['doctordescription'] as String
          : null,
      doctorlisencenumber: map['doctorlisencenumber'] != null
          ? map['doctorlisencenumber'] as String
          : null,
      doctorlisenceimageurl: map['doctorlisenceimageurl'] != null
          ? map['doctorlisenceimageurl'] as String
          : null,
      doctorexperience: map['doctorexperience'] != null
          ? map['doctorexperience'] as String
          : null,
      totalappointmentstalen: map['totalappointmentstalen'] != null
          ? map['totalappointmentstalen'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor_Model.fromJson(String source) =>
      Doctor_Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Doctor_Model(doctorname: $doctorname, doctorid: $doctorid, doctorage: $doctorage, doctorspecialization: $doctorspecialization, doctorimageurl: $doctorimageurl, doctordescription: $doctordescription, doctorlisencenumber: $doctorlisencenumber, doctorlisenceimageurl: $doctorlisenceimageurl, doctorexperience: $doctorexperience, totalappointmentstalen: $totalappointmentstalen)';
  }

  @override
  bool operator ==(covariant Doctor_Model other) {
    if (identical(this, other)) return true;

    return other.doctorname == doctorname &&
        other.doctorid == doctorid &&
        other.doctorage == doctorage &&
        other.doctorspecialization == doctorspecialization &&
        other.doctorimageurl == doctorimageurl &&
        other.doctordescription == doctordescription &&
        other.doctorlisencenumber == doctorlisencenumber &&
        other.doctorlisenceimageurl == doctorlisenceimageurl &&
        other.doctorexperience == doctorexperience &&
        other.totalappointmentstalen == totalappointmentstalen;
  }

  @override
  int get hashCode {
    return doctorname.hashCode ^
        doctorid.hashCode ^
        doctorage.hashCode ^
        doctorspecialization.hashCode ^
        doctorimageurl.hashCode ^
        doctordescription.hashCode ^
        doctorlisencenumber.hashCode ^
        doctorlisenceimageurl.hashCode ^
        doctorexperience.hashCode ^
        totalappointmentstalen.hashCode;
  }
}
