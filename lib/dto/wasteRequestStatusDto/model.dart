// To parse this JSON data, do
//
//     final wasteStatusModel = wasteStatusModelFromJson(jsonString);

import 'dart:convert';

WasteStatusModel wasteStatusModelFromJson(String str) => WasteStatusModel.fromJson(json.decode(str));

String wasteStatusModelToJson(WasteStatusModel data) => json.encode(data.toJson());

class WasteStatusModel {
    WasteStatusModel({
        this.success,
        this.data,
    });

    bool? success;
    List<DataStatus>? data;

    factory WasteStatusModel.fromJson(Map<String, dynamic> json) => WasteStatusModel(
        success: json["success"],
        data: List<DataStatus>.from(json["data"].map((x) => DataStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DataStatus {
    DataStatus ({
        this.id,
        this.status,
        this.wasteItemsId,
        this.groupId,
        this.followupStatus,
        this.ip,
        this.date,
        this.time,
        this.customerId,
        this.weight,
        this.quantity,
        this.localbodyId,
        this.wardId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    int? status;
    List<WasteItemsId>? wasteItemsId;
    List<GroupId>? groupId;
    int? followupStatus;
    String? ip;
    DateTime? date;
    String? time;
    CustomerId? customerId;
    String? weight;
    int? quantity;
    LocalbodyId? localbodyId;
    WardId? wardId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory DataStatus .fromJson(Map<String, dynamic> json) => DataStatus (
        id: json["_id"],
        status: json["status"],
        wasteItemsId: List<WasteItemsId>.from(json["waste_items_id"].map((x) => WasteItemsId.fromJson(x))),
        groupId: List<GroupId>.from(json["group_id"].map((x) => GroupId.fromJson(x))),
        followupStatus: json["followup_status"],
        ip: json["_ip"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        customerId: CustomerId.fromJson(json["customer_id"]),
        weight: json["weight"],
        quantity: json["quantity"],
        localbodyId: LocalbodyId.fromJson(json["localbody_id"]),
        wardId: WardId.fromJson(json["ward_id"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "waste_items_id": List<dynamic>.from(wasteItemsId!.map((x) => x.toJson())),
        "group_id": List<dynamic>.from(groupId!.map((x) => x.toJson())),
        "followup_status": followupStatus,
        "_ip": ip,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "customer_id": customerId?.toJson(),
        "weight": weight,
        "quantity": quantity,
        "localbody_id": localbodyId?.toJson(),
        "ward_id": wardId?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class CustomerId {
    CustomerId({
        this.id,
        this.custName,
    });

    String? id;
    String? custName;

    factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["_id"],
        custName: json["cust_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cust_name": custName,
    };
}

class GroupId {
    GroupId({
        this.id,
        this.groupName,
    });

    String? id;
    String? groupName;

    factory GroupId.fromJson(Map<String, dynamic> json) => GroupId(
        id: json["_id"],
        groupName: json["group_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "group_name": groupName,
    };
}

class LocalbodyId {
    LocalbodyId({
        this.id,
        this.localbodyName,
    });

    String? id;
    String? localbodyName;

    factory LocalbodyId.fromJson(Map<String, dynamic> json) => LocalbodyId(
        id: json["_id"],
        localbodyName: json["localbody_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "localbody_name": localbodyName,
    };
}

class WardId {
    WardId({
        this.id,
        this.wardName,
    });

    String? id;
    String? wardName;

    factory WardId.fromJson(Map<String, dynamic> json) => WardId(
        id: json["_id"],
        wardName: json["ward_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ward_name": wardName,
    };
}

class WasteItemsId {
    WasteItemsId({
        this.id,
        this.wasteItemsName,
    });

    String? id;
    String? wasteItemsName;

    factory WasteItemsId.fromJson(Map<String, dynamic> json) => WasteItemsId(
        id: json["_id"],
        wasteItemsName: json["waste_items_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "waste_items_name": wasteItemsName,
    };
}

