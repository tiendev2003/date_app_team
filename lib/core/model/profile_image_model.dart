import 'dart:convert';

import 'user_model.dart';

 
Profilepickimage profilepickimageFromJson(String str) =>
    Profilepickimage.fromJson(json.decode(str));

String profilepickimageToJson(Profilepickimage data) =>
    json.encode(data.toJson());

class Profilepickimage {
  UserLogin? userLogin;
  String? responseCode;
  String? result;
  String? responseMsg;

  Profilepickimage({
    this.userLogin,
    this.responseCode,
    this.result,
    this.responseMsg,
  });

  factory Profilepickimage.fromJson(Map<String, dynamic> json) =>
      Profilepickimage(
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
