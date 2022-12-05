// To parse this JSON data, do
//
//     final phonebookModel = phonebookModelFromJson(jsonString);

import 'dart:convert';

PhonebookModel phonebookModelFromJson(String str) => PhonebookModel.fromJson(json.decode(str));

String phonebookModelToJson(PhonebookModel data) => json.encode(data.toJson());

class PhonebookModel {
    PhonebookModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory PhonebookModel.fromJson(Map<String, dynamic> json) => PhonebookModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.firstName,
        this.mobile,
        this.lastName,
        this.userImage,
        this.privilage,
        this.ward,
    });

    String? id;
    String? firstName;
    String? mobile;
    String? lastName;
    String? userImage;
    String? privilage;
    String? ward;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        firstName: json["firstName"],
        mobile: json["mobile"],
        lastName: json["lastName"],
        userImage: json["user_image"],
        privilage: json["privilage"],
        ward: json["ward"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "mobile": mobile,
        "lastName": lastName,
        "user_image": userImage,
        "privilage": privilage,
        "ward": ward,
    };
}
