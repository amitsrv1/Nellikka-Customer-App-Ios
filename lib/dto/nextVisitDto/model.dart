// To parse this JSON data, do
//
//     final staffNextVisitModel = staffNextVisitModelFromJson(jsonString);

import 'dart:convert';

StaffNextVisitModel staffNextVisitModelFromJson(String str) => StaffNextVisitModel.fromJson(json.decode(str));

String staffNextVisitModelToJson(StaffNextVisitModel data) => json.encode(data.toJson());

class StaffNextVisitModel {
    StaffNextVisitModel({
        this.status,
        this.data,
    });

    int? status;
    List<Datum>? data;

    factory StaffNextVisitModel.fromJson(Map<String, dynamic> json) => StaffNextVisitModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.custPackageId,
        this.custPackageVisit,
        this.previousVistDate,
        this.nextvisit,
        this.previousVisitDay,
        this.nextvisitDay,
    });

    String? id;
    String? custPackageId;
    int? custPackageVisit;
    DateTime? previousVistDate;
    DateTime? nextvisit;
    String? previousVisitDay;
    String? nextvisitDay;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        custPackageId: json["cust_package_id"],
        custPackageVisit: json["cust_package_visit"],
        previousVistDate: DateTime.parse(json["previous_vist_date"]),
        nextvisit: DateTime.parse(json["nextvisit"]),
        previousVisitDay: json["previous_visit_day"],
        nextvisitDay: json["nextvisit_day"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cust_package_id": custPackageId,
        "cust_package_visit": custPackageVisit,
        "previous_vist_date": "${previousVistDate?.year.toString().padLeft(4, '0')}-${previousVistDate?.month.toString().padLeft(2, '0')}-${previousVistDate?.day.toString().padLeft(2, '0')}",
        "nextvisit": "${nextvisit?.year.toString().padLeft(4, '0')}-${nextvisit?.month.toString().padLeft(2, '0')}-${nextvisit?.day.toString().padLeft(2, '0')}",
        "previous_visit_day": previousVisitDay,
        "nextvisit_day": nextvisitDay,
    };
}
