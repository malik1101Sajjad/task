import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  String? userImages;
  String? dateOfBirth;
  String? gender;
  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.userImages,
    this.dateOfBirth,
    this.gender,
    this.id,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNo,
    String? userImages,
    String? dateOfBirth,
    String? gender,
    String? id,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      userImages: userImages ?? this.userImages,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNo': phoneNo,
      'userImages': userImages,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNo: map['phoneNo'] != null ? map['phoneNo'] as String : null,
      userImages:
          map['userImages'] != null ? map['userImages'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, phoneNo: $phoneNo, userImages: $userImages, dateOfBirth: $dateOfBirth, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phoneNo == phoneNo &&
        other.userImages == userImages &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNo.hashCode ^
        userImages.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode;
  }
}
