// To parse this JSON data, do
//
//     final userLoginEntity = userLoginEntityFromJson(jsonString);

import 'dart:convert';

UserLoginEntity userLoginEntityFromJson(String str) => UserLoginEntity.fromJson(json.decode(str));

String userLoginEntityToJson(UserLoginEntity data) => json.encode(data.toJson());

class UserLoginEntity {
    UserLoginEntity({
        required this.username,
        required this.password,
        required this.requestToken,
    });

    String username;
    String password;
    String requestToken;

    factory UserLoginEntity.fromJson(Map<String, dynamic> json) => UserLoginEntity(
        username: json["username"],
        password: json["password"],
        requestToken: json["request_token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "request_token": requestToken,
    };
}
