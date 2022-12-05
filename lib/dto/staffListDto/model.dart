// To parse this JSON data, do
//
//     final staffListModel = staffListModelFromJson(jsonString);

import 'dart:convert';

StaffListModel staffListModelFromJson(String str) => StaffListModel.fromJson(json.decode(str));

String staffListModelToJson(StaffListModel data) => json.encode(data.toJson());

class StaffListModel {
    StaffListModel({
        this.success,
        this.data,
    });

    bool? success;
    List<StaffDatum>? data;

    factory StaffListModel.fromJson(Map<String, dynamic> json) => StaffListModel(
        success: json["success"],
        data: List<StaffDatum>.from(json["data"].map((x) => StaffDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class StaffDatum {
    StaffDatum({
        this.id,
        this.firstName,
        this.lastName,
        this.mobile,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? mobile;

    factory StaffDatum.fromJson(Map<String, dynamic> json) => StaffDatum(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
    };
}
