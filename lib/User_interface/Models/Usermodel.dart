// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User_model {
  String? userId;
  String? name;
  String? Email;
  DateTime? dob;
  String? imageurl;
  String? phonenumber;
  User_model({
    this.userId,
    this.name,
    this.Email,
    this.dob,
    this.imageurl,
    this.phonenumber,
  });

  User_model copyWith({
    String? userId,
    String? name,
    String? Email,
    DateTime? dob,
    String? imageurl,
    String? phonenumber,
  }) {
    return User_model(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      Email: Email ?? this.Email,
      dob: dob ?? this.dob,
      imageurl: imageurl ?? this.imageurl,
      phonenumber: phonenumber ?? this.phonenumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'Email': Email,
      'dob': dob?.millisecondsSinceEpoch,
      'imageurl': imageurl,
      'phonenumber': phonenumber,
    };
  }

  factory User_model.fromMap(Map<String, dynamic> map) {
    return User_model(
      userId: map['userId'] != null ? map['userId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      Email: map['Email'] != null ? map['Email'] as String : null,
      dob: map['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dob'] as int)
          : null,
      imageurl: map['imageurl'] != null ? map['imageurl'] as String : null,
      phonenumber:
          map['phonenumber'] != null ? map['phonenumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User_model.fromJson(String source) =>
      User_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User_model(userId: $userId, name: $name, Email: $Email, dob: $dob, imageurl: $imageurl, phonenumber: $phonenumber)';
  }

  @override
  bool operator ==(covariant User_model other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.name == name &&
        other.Email == Email &&
        other.dob == dob &&
        other.imageurl == imageurl &&
        other.phonenumber == phonenumber;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        Email.hashCode ^
        dob.hashCode ^
        imageurl.hashCode ^
        phonenumber.hashCode;
  }
}
