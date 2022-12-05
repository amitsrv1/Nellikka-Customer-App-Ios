// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
    InvoiceModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
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
        this.invoiceTime,
        this.invoiceTotalAmt,
        this.invoiceNo,
        this.date,
        this.balance,
        this.staff,
    });

    String? id;
    String? invoiceTime;
    int? invoiceTotalAmt;
    String? invoiceNo;
    String? date;
    int? balance;
    String? staff;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        invoiceTime: json["invoice_time"],
        invoiceTotalAmt: json["invoice_total_amt"],
        invoiceNo: json["invoice_no"],
        date: json["date"],
        balance: json["balance"],
        staff: json["staff"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "invoice_time": invoiceTime,
        "invoice_total_amt": invoiceTotalAmt,
        "invoice_no": invoiceNo,
        "date": date,
        "balance": balance,
        "staff": staff,
    };
}
