// To parse this JSON data, do
//
//     final receiptModel = receiptModelFromJson(jsonString);

import 'dart:convert';

ReceiptModel receiptModelFromJson(String str) => ReceiptModel.fromJson(json.decode(str));

String receiptModelToJson(ReceiptModel data) => json.encode(data.toJson());

class ReceiptModel {
    ReceiptModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory ReceiptModel.fromJson(Map<String, dynamic> json) => ReceiptModel(
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
        this.receiptTime,
        this.recieptAmount,
        this.receiptNo,
        this.date,
        this.balance,
        this.staff,
    });

    String? id;
    String? receiptTime;
    int? recieptAmount;
    String? receiptNo;
    String? date;
    int? balance;
    String? staff;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        receiptTime: json["receipt_time"],
        recieptAmount: json["reciept_amount"],
        receiptNo: json["receipt_no"],
        date: json["date"],
        balance: json["balance"] == null ? null : json["balance"],
        staff: json["staff"] == null ? null : json["staff"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "receipt_time": receiptTime,
        "reciept_amount": recieptAmount,
        "receipt_no": receiptNo,
        "date": date,
        "balance": balance == null ? null : balance,
        "staff": staff == null ? null : staff,
    };
}
