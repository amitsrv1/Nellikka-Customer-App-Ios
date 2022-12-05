// To parse this JSON data, do
//
//     final statementListModel = statementListModelFromJson(jsonString);

import 'dart:convert';

StatementListModel statementListModelFromJson(String str) => StatementListModel.fromJson(json.decode(str));

String statementListModelToJson(StatementListModel data) => json.encode(data.toJson());

class StatementListModel {
    StatementListModel({
        this.success,
        this.data,
        this.unbilled,
    });

    bool? success;
    List<Datums>? data;
    List<Unbilled>? unbilled;

    factory StatementListModel.fromJson(Map<String, dynamic> json) => StatementListModel(
        success: json["success"],
        data: List<Datums>.from(json["data"].map((x) => Datums.fromJson(x))),
        unbilled: List<Unbilled>.from(json["unbilled"].map((x) => Unbilled.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "unbilled": List<dynamic>.from(unbilled!.map((x) => x.toJson())),
    };
}

class Datums {
    Datums({
        this.id,
        this.date,
        this.time,
        this.statementType,
        this.referenceNo,
        this.credit,
        this.debit,
        this.balance,
    });

    String? id;
    String? date;
    String? time;
    String? statementType;
    String? referenceNo;
    int? credit;
    int? debit;
    int? balance;

    factory Datums.fromJson(Map<String, dynamic> json) => Datums(
        id: json["_id"],
        date: json["date"],
        time: json["time"],
        statementType: json["statement_type"],
        referenceNo: json["reference_no"],
        credit: json["credit"],
        debit: json["debit"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date,
        "time": time,
        "statement_type": statementType,
        "reference_no": referenceNo,
        "credit": credit,
        "debit": debit,
        "balance": balance,
    };
}

class Unbilled {
    Unbilled({
        this.id,
        this.vcountMonthDue,
        this.date,
        this.statementType,
        this.referenceNo,
        this.balance,
    });

    String? id;
    int? vcountMonthDue;
    String? date;
    String? statementType;
    String? referenceNo;
    String? balance;

    factory Unbilled.fromJson(Map<String, dynamic> json) => Unbilled(
        id: json["_id"],
        vcountMonthDue: json["vcount_month_due"],
        date: json["date"],
        statementType: json["statement_type"],
        referenceNo: json["reference_no"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "vcount_month_due": vcountMonthDue,
        "date": date,
        "statement_type": statementType,
        "reference_no": referenceNo,
        "balance": balance,
    };
}
