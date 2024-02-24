// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  final String email;
  final String uid;
  final int? totalAmount;

  UserData({
    required this.email,
    required this.uid,
    this.totalAmount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'uid': uid,
      'totalAmount': totalAmount,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map, String docId) {
    return UserData(
      email: map['email'] as String,
      uid: docId,
      totalAmount: map['totalAmount'],
    );
  }
}
