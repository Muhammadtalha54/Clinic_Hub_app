// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// model for the patient to handle the reviews
class Reviewsmodel {
  String? Patientid;
  String? Patientimageurl;
  String? PatientReviewMessage;
  int? rating;
  String? doctorid;
  String? doctorname;
  Reviewsmodel({
    this.Patientid,
    this.Patientimageurl,
    this.PatientReviewMessage,
    this.rating,
    this.doctorid,
    this.doctorname,
  });

  Reviewsmodel copyWith({
    String? Patientid,
    String? Patientimageurl,
    String? PatientReviewMessage,
    int? rating,
    String? doctorid,
    String? doctorname,
  }) {
    return Reviewsmodel(
      Patientid: Patientid ?? this.Patientid,
      Patientimageurl: Patientimageurl ?? this.Patientimageurl,
      PatientReviewMessage: PatientReviewMessage ?? this.PatientReviewMessage,
      rating: rating ?? this.rating,
      doctorid: doctorid ?? this.doctorid,
      doctorname: doctorname ?? this.doctorname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Patientid': Patientid,
      'Patientimageurl': Patientimageurl,
      'PatientReviewMessage': PatientReviewMessage,
      'rating': rating,
      'doctorid': doctorid,
      'doctorname': doctorname,
    };
  }

  factory Reviewsmodel.fromMap(Map<String, dynamic> map) {
    return Reviewsmodel(
      Patientid: map['Patientid'] != null ? map['Patientid'] as String : null,
      Patientimageurl: map['Patientimageurl'] != null
          ? map['Patientimageurl'] as String
          : null,
      PatientReviewMessage: map['PatientReviewMessage'] != null
          ? map['PatientReviewMessage'] as String
          : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      doctorid: map['doctorid'] != null ? map['doctorid'] as String : null,
      doctorname:
          map['doctorname'] != null ? map['doctorname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviewsmodel.fromJson(String source) =>
      Reviewsmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reviewsmodel(Patientid: $Patientid, Patientimageurl: $Patientimageurl, PatientReviewMessage: $PatientReviewMessage, rating: $rating, doctorid: $doctorid, doctorname: $doctorname)';
  }

  @override
  bool operator ==(covariant Reviewsmodel other) {
    if (identical(this, other)) return true;

    return other.Patientid == Patientid &&
        other.Patientimageurl == Patientimageurl &&
        other.PatientReviewMessage == PatientReviewMessage &&
        other.rating == rating &&
        other.doctorid == doctorid &&
        other.doctorname == doctorname;
  }

  @override
  int get hashCode {
    return Patientid.hashCode ^
        Patientimageurl.hashCode ^
        PatientReviewMessage.hashCode ^
        rating.hashCode ^
        doctorid.hashCode ^
        doctorname.hashCode;
  }
}
