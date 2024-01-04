// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FamilyModle {
  String? fullName;
  String? realation;
  String? phoneNo;
  String? dateBirth;
  FamilyModle({
    this.fullName,
    this.realation,
    this.phoneNo,
    this.dateBirth,
  });

  // FamilyModle copyWith({
  //   String? fullName,
  //   String? realation,
  //   String? phoneNo,
  //   String? dateBirth,
  // }) {
  //   return FamilyModle(
  //     fullName: fullName ?? this.fullName,
  //     realation: realation ?? this.realation,
  //     phoneNo: phoneNo ?? this.phoneNo,
  //     dateBirth: dateBirth ?? this.dateBirth,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'realation': realation,
      'phoneNo': phoneNo,
      'dateBirth': dateBirth,
    };
  }

  factory FamilyModle.fromMap(Map<String, dynamic> map) {
    return FamilyModle(
      fullName: map['fullName'] ,
      realation: map['realation'] ,
      phoneNo: map['phoneNo'] ,
      dateBirth: map['dateBirth'],
    );
  }
}
