// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? userName;
  final String? email;
  final String? photoUrl;

  UserModel({
    required this.userName,
    required this.email,
    required this.photoUrl,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? photoUrl,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        email: json["email"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'photo_url': photoUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
