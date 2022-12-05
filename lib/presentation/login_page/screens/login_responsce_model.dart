import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.success,
    required this.otp
  });
  late final String message;
  late final bool success;
  late final int? otp;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['success'] = success;
    _data['otp'] = otp;
    return _data;
  }
}

VerifyResponseModel verifyResponseJson(String str) =>
    VerifyResponseModel.fromJson(json.decode(str));

class VerifyResponseModel {
  VerifyResponseModel({
    required this.success,
    required this.message,
    required this.customer_id
  });
  late final bool success;
  late final String? message;
  late final String? customer_id;

  VerifyResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    customer_id = json['customer_id'];
    
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['success'] = success;
    return _data;
  }
}


GenerateTokenModel generateTokenModelFromJson(String str) => GenerateTokenModel.fromJson(json.decode(str));

String generateTokenModelToJson(GenerateTokenModel data) => json.encode(data.toJson());

class GenerateTokenModel {
    GenerateTokenModel({
        this.success,
        this.message,
        this.token,
    });

    bool? success;
    String? message;
    String? token;

    factory GenerateTokenModel.fromJson(Map<String, dynamic> json) => GenerateTokenModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
    };
}
