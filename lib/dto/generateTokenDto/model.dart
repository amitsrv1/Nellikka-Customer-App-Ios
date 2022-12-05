// To parse this JSON data, do
//
//     final generateTokenModel = generateTokenModelFromJson(jsonString);

import 'dart:convert';

GenerateTokensModel generateTokensModelFromJson(String str) => GenerateTokensModel.fromJson(json.decode(str));

String generateTokenModelToJson(GenerateTokensModel data) => json.encode(data.toJson());

class GenerateTokensModel {
    GenerateTokensModel({
        this.success,
        this.message,
        this.token,
    });

    bool? success;
    String? message;
    String? token;

    factory GenerateTokensModel.fromJson(Map<String, dynamic> json) => GenerateTokensModel(
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
