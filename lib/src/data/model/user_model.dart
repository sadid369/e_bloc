// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? userName;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  UserModel({
    required this.userName,
    required this.email,
    required this.photoUrl,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? photoUrl,
    String? phoneNumber,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userName: json["user_name"],
        email: json["email"],
        photoUrl: json["photo_url"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'photo_url': photoUrl,
      'phone_number': phoneNumber
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
