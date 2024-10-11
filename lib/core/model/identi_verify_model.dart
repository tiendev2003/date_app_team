// To parse this JSON data, do
//
//     final identiDoc = identiDocFromJson(jsonString);

import 'dart:convert';

import 'user_model.dart';

IdentiDoc identiDocFromJson(String str) => IdentiDoc.fromJson(json.decode(str));

String identiDocToJson(IdentiDoc data) => json.encode(data.toJson());

class IdentiDoc {
  UserLogin? userLogin;
  String? responseCode;
  String? result;
  String? responseMsg;

  IdentiDoc({
    this.userLogin,
    this.responseCode,
    this.result,
    this.responseMsg,
  });

  factory IdentiDoc.fromJson(Map<String, dynamic> json) => IdentiDoc(
        userLogin: json["UserLogin"] == null
            ? null
            : UserLogin.fromJson(json["UserLogin"]),
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
      );

  Map<String, dynamic> toJson() => {
        "UserLogin": userLogin?.toJson(),
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
      };
}

 