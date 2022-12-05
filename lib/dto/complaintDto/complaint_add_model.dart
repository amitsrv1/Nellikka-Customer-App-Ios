// To parse this JSON data, do
//
//     final complaintAddModel = complaintAddModelFromJson(jsonString);

import 'dart:convert';

ComplaintAddModel complaintAddModelFromJson(String str) => ComplaintAddModel.fromJson(json.decode(str));

String complaintAddModelToJson(ComplaintAddModel data) => json.encode(data.toJson());

class ComplaintAddModel {
    ComplaintAddModel({
        this.success,
        this.data,
    });

    bool? success;
    Data? data;

    factory ComplaintAddModel.fromJson(Map<String, dynamic> json) => ComplaintAddModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.complaintActivestatus,
        this.image,
        this.status,
        this.id,
        this.complaintType,
        this.comment,
        this.complaintLocalbody,
        this.complaintWard,
        this.complaintGroup,
        this.date,
        this.time,
        this.complaintIp,
        this.staffId,
        this.customerId,
        this.complaintId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    int? complaintActivestatus;
     List<String>? image;
    int? status;
    String? id;
    String? complaintType;
    String? comment;
    String? complaintLocalbody;
    String? complaintWard;
    String? complaintGroup;
    DateTime? date;
    String? time;
    String? complaintIp;
    String? staffId;
    String? customerId;
    String? complaintId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        complaintActivestatus: json["complaint_activestatus"],
        image: List<String>.from(json["image"].map((x) => x)),
        status: json["status"],
        id: json["_id"],
        complaintType: json["complaint_type"],
        comment: json["comment"],
        complaintLocalbody: json["complaint_localbody"],
        complaintWard: json["complaint_ward"],
        complaintGroup: json["complaint_group"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        complaintIp: json["complaint_ip"],
        staffId: json["staff_id"],
        customerId: json["customer_id"],
        complaintId: json["complaint_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "complaint_activestatus": complaintActivestatus,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "status": status,
        "_id": id,
        "complaint_type": complaintType,
        "comment": comment,
        "complaint_localbody": complaintLocalbody,
        "complaint_ward": complaintWard,
        "complaint_group": complaintGroup,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "complaint_ip": complaintIp,
        "staff_id": staffId,
        "customer_id": customerId,
        "complaint_id": complaintId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
