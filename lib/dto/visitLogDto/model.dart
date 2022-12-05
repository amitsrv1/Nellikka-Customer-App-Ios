// To parse this JSON data, do
//
//     final visitLogModel = visitLogModelFromJson(jsonString);

import 'dart:convert';

VisitLogModel visitLogModelFromJson(String str) => VisitLogModel.fromJson(json.decode(str));

String visitLogModelToJson(VisitLogModel data) => json.encode(data.toJson());

class VisitLogModel {
    VisitLogModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory VisitLogModel.fromJson(Map<String, dynamic> json) => VisitLogModel(
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
        this.wasteCltTime,
        this.wasteCltUniqueId,
        this.createdAt,
        this.wastecollect,
        this.wasteCltDate,
        this.wasteCltTotalAmount,
        this.wasteCltStatus,
        this.staff,
        this.wasteCltDeleteStatus,
    });

    String? id;
    String? wasteCltTime;
    String? wasteCltUniqueId;
    DateTime? createdAt;
    List<Wastecollect>? wastecollect;
    String? wasteCltDate;
    int? wasteCltTotalAmount;
    String? wasteCltStatus;
    String? staff;
    int? wasteCltDeleteStatus;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        wasteCltTime: json["waste_clt_time"],
        wasteCltUniqueId: json["waste_clt_unique_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        wastecollect: List<Wastecollect>.from(json["wastecollect"].map((x) => Wastecollect.fromJson(x))),
        wasteCltDate: json["waste_clt_date"],
        wasteCltTotalAmount: json["waste_clt_total_amount"],
        wasteCltStatus: json["waste_clt_status"],
        staff: json["staff"],
        wasteCltDeleteStatus: json["waste_clt_delete_status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "waste_clt_time": wasteCltTime,
        "waste_clt_unique_id": wasteCltUniqueId,
        "createdAt": createdAt!.toIso8601String(),
        "wastecollect": List<dynamic>.from(wastecollect!.map((x) => x.toJson())),
        "waste_clt_date": wasteCltDate,
        "waste_clt_total_amount": wasteCltTotalAmount,
        "waste_clt_status": wasteCltStatus,
        "staff": staff,
        "waste_clt_delete_status": wasteCltDeleteStatus,
    };
}

class Wastecollect {
    Wastecollect({
        this.id,
        this.wasteCltItemName,
        this.wasteCltItemPrice,
        this.wasteCltItemNoBag,
        this.wasteCltItemNoKg,
        this.wasteCltItemPaidStatus,
        this.wasteCltItemAmt,
    });

    String? id;
    String? wasteCltItemName;
    int? wasteCltItemPrice;
    int? wasteCltItemNoBag;
    String? wasteCltItemNoKg;
    int? wasteCltItemPaidStatus;
    int? wasteCltItemAmt;

    factory Wastecollect.fromJson(Map<String, dynamic> json) => Wastecollect(
        id: json["_id"],
        wasteCltItemName: json["waste_clt_item_name"],
        wasteCltItemPrice: json["waste_clt_item_price"],
        wasteCltItemNoBag: json["waste_clt_item_no_bag"],
        wasteCltItemNoKg: json["waste_clt_item_no_kg"],
        wasteCltItemPaidStatus: json["waste_clt_item_paid_status"],
        wasteCltItemAmt: json["waste_clt_item_amt"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "waste_clt_item_name": wasteCltItemName,
        "waste_clt_item_price": wasteCltItemPrice,
        "waste_clt_item_no_bag": wasteCltItemNoBag,
        "waste_clt_item_no_kg": wasteCltItemNoKg,
        "waste_clt_item_paid_status": wasteCltItemPaidStatus,
        "waste_clt_item_amt": wasteCltItemAmt,
    };
}
