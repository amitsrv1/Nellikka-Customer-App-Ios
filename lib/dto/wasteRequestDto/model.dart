// To parse this JSON data, do
//
//     final wasteRequestModel = wasteRequestModelFromJson(jsonString);

import 'dart:convert';

WasteRequestModel wasteRequestModelFromJson(String str) => WasteRequestModel.fromJson(json.decode(str));

String wasteRequestModelToJson(WasteRequestModel data) => json.encode(data.toJson());

class WasteRequestModel {
    WasteRequestModel({
        this.success,
        this.data,
    });

    bool? success;
    WData? data;

    factory WasteRequestModel.fromJson(Map<String, dynamic> json) => WasteRequestModel(
        success: json["success"],
        data: WData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
    };
}

class WData {
    WData({
        this.status,
        this.groupId,
        this.followupStatus,
        this.id,
        this.ip,
        this.date,
        this.time,
        this.customerId,
        this.localbodyId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    int? status;
    List<dynamic>? groupId;
    int? followupStatus;
    String? id;
    String? ip;
    DateTime? date;
    String? time;
    String? customerId;
    String? localbodyId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory WData.fromJson(Map<String, dynamic> json) => WData(
        status: json["status"],
        groupId: List<dynamic>.from(json["group_id"].map((x) => x)),
        followupStatus: json["followup_status"],
        id: json["_id"],
        ip: json["_ip"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        customerId: json["customer_id"],
        localbodyId: json["localbody_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "group_id": List<dynamic>.from(groupId!.map((x) => x)),
        "followup_status": followupStatus,
        "_id": id,
        "_ip": ip,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "customer_id": customerId,
        "localbody_id": localbodyId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}