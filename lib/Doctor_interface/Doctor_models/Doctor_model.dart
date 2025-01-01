// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
// model for the doctor
class Doctor_Model {
  String? doctorid;
  String? doctorname;
  String? Doctoremail;
  // String? devicetoken;

  String? doctorDOB; //dob

  String? password;
  String? doctorimageurl; //profile image url
  String? doctorexperience; //experience
  String? doctordescription; //description of the doctor
  String? doctorgender; //doctorgender
  String? doctorspecialization; //category

  String? doctorlisencenumber; //lisence number
  String? doctorlisenceimageurl; //liscenceimgeurl

  int? totalappointmentstaken; //total appointments

  RxBool? isfavourite = false.obs;
  Doctor_Model({
    this.doctorid,
    this.doctorname,
    this.Doctoremail,
    this.doctorDOB,
    this.password,
    this.doctorimageurl,
    this.doctorexperience,
    this.doctordescription,
    this.doctorgender,
    this.doctorspecialization,
    this.doctorlisencenumber,
    this.doctorlisenceimageurl,
    this.totalappointmentstaken,
    this.isfavourite,
  });
  

  Doctor_Model copyWith({
    String? doctorid,
    String? doctorname,
    String? Doctoremail,
    String? doctorDOB,
    String? password,
    String? doctorimageurl,
    String? doctorexperience,
    String? doctordescription,
    String? doctorgender,
    String? doctorspecialization,
    String? doctorlisencenumber,
    String? doctorlisenceimageurl,
    int? totalappointmentstaken,
    RxBool? isfavourite,
  }) {
    return Doctor_Model(
      doctorid: doctorid ?? this.doctorid,
      doctorname: doctorname ?? this.doctorname,
      Doctoremail: Doctoremail ?? this.Doctoremail,
      doctorDOB: doctorDOB ?? this.doctorDOB,
      password: password ?? this.password,
      doctorimageurl: doctorimageurl ?? this.doctorimageurl,
      doctorexperience: doctorexperience ?? this.doctorexperience,
      doctordescription: doctordescription ?? this.doctordescription,
      doctorgender: doctorgender ?? this.doctorgender,
      doctorspecialization: doctorspecialization ?? this.doctorspecialization,
      doctorlisencenumber: doctorlisencenumber ?? this.doctorlisencenumber,
      doctorlisenceimageurl: doctorlisenceimageurl ?? this.doctorlisenceimageurl,
      totalappointmentstaken: totalappointmentstaken ?? this.totalappointmentstaken,
      isfavourite: isfavourite ?? this.isfavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctorid': doctorid,
      'doctorname': doctorname,
      'Doctoremail': Doctoremail,
      'doctorDOB': doctorDOB,
      'password': password,
      'doctorimageurl': doctorimageurl,
      'doctorexperience': doctorexperience,
      'doctordescription': doctordescription,
      'doctorgender': doctorgender,
      'doctorspecialization': doctorspecialization,
      'doctorlisencenumber': doctorlisencenumber,
      'doctorlisenceimageurl': doctorlisenceimageurl,
      'totalappointmentstaken': totalappointmentstaken,
      'isfavourite': isfavourite?.value,
    };
  }

  factory Doctor_Model.fromMap(Map<String, dynamic> map) {
    return Doctor_Model(
      doctorid: map['doctorid'] != null ? map['doctorid'] as String : null,
      doctorname: map['doctorname'] != null ? map['doctorname'] as String : null,
      Doctoremail: map['Doctoremail'] != null ? map['Doctoremail'] as String : null,
      doctorDOB: map['doctorDOB'] != null ? map['doctorDOB'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      doctorimageurl: map['doctorimageurl'] != null ? map['doctorimageurl'] as String : null,
      doctorexperience: map['doctorexperience'] != null ? map['doctorexperience'] as String : null,
      doctordescription: map['doctordescription'] != null ? map['doctordescription'] as String : null,
      doctorgender: map['doctorgender'] != null ? map['doctorgender'] as String : null,
      doctorspecialization: map['doctorspecialization'] != null ? map['doctorspecialization'] as String : null,
      doctorlisencenumber: map['doctorlisencenumber'] != null ? map['doctorlisencenumber'] as String : null,
      doctorlisenceimageurl: map['doctorlisenceimageurl'] != null ? map['doctorlisenceimageurl'] as String : null,
      totalappointmentstaken: map['totalappointmentstaken'] != null ? map['totalappointmentstaken'] as int : null,
      isfavourite: map['isfavourite'] != null ? RxBool(map['isfavourite'] as bool) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor_Model.fromJson(String source) => Doctor_Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Doctor_Model(doctorid: $doctorid, doctorname: $doctorname, Doctoremail: $Doctoremail, doctorDOB: $doctorDOB, password: $password, doctorimageurl: $doctorimageurl, doctorexperience: $doctorexperience, doctordescription: $doctordescription, doctorgender: $doctorgender, doctorspecialization: $doctorspecialization, doctorlisencenumber: $doctorlisencenumber, doctorlisenceimageurl: $doctorlisenceimageurl, totalappointmentstaken: $totalappointmentstaken, isfavourite: $isfavourite)';
  }

  @override
  bool operator ==(covariant Doctor_Model other) {
    if (identical(this, other)) return true;
  
    return 
      other.doctorid == doctorid &&
      other.doctorname == doctorname &&
      other.Doctoremail == Doctoremail &&
      other.doctorDOB == doctorDOB &&
      other.password == password &&
      other.doctorimageurl == doctorimageurl &&
      other.doctorexperience == doctorexperience &&
      other.doctordescription == doctordescription &&
      other.doctorgender == doctorgender &&
      other.doctorspecialization == doctorspecialization &&
      other.doctorlisencenumber == doctorlisencenumber &&
      other.doctorlisenceimageurl == doctorlisenceimageurl &&
      other.totalappointmentstaken == totalappointmentstaken &&
      other.isfavourite == isfavourite;
  }

  @override
  int get hashCode {
    return doctorid.hashCode ^
      doctorname.hashCode ^
      Doctoremail.hashCode ^
      doctorDOB.hashCode ^
      password.hashCode ^
      doctorimageurl.hashCode ^
      doctorexperience.hashCode ^
      doctordescription.hashCode ^
      doctorgender.hashCode ^
      doctorspecialization.hashCode ^
      doctorlisencenumber.hashCode ^
      doctorlisenceimageurl.hashCode ^
      totalappointmentstaken.hashCode ^
      isfavourite.hashCode;
  }
}
