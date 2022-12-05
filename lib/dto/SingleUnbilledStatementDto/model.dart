// To parse this JSON data, do
//
//     final singleUnbilledStatementModel = singleUnbilledStatementModelFromJson(jsonString);

import 'dart:convert';

SingleUnbilledStatementModel singleUnbilledStatementModelFromJson(String str) => SingleUnbilledStatementModel.fromJson(json.decode(str));

String singleUnbilledStatementModelToJson(SingleUnbilledStatementModel data) => json.encode(data.toJson());

class SingleUnbilledStatementModel {
    SingleUnbilledStatementModel({
        this.success,
        this.statement,
        this.data,
    });

    bool? success;
    Statement? statement;
    List<Datum>? data;

    factory SingleUnbilledStatementModel.fromJson(Map<String, dynamic> json) => SingleUnbilledStatementModel(
        success: json["success"],
        statement: Statement.fromJson(json["statement"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statement": statement?.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.wasteCltDate,
        this.wasteCltTime,
        this.wasteCltTotalAmount,
        this.wasteCltUniqueId,
        this.staffName,
    });

    String? id;
    String? wasteCltDate;
    String? wasteCltTime;
    int? wasteCltTotalAmount;
    String? wasteCltUniqueId;
    String? staffName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        wasteCltDate: json["waste_clt_date"],
        wasteCltTime: json["waste_clt_time"],
        wasteCltTotalAmount: json["waste_clt_total_amount"],
        wasteCltUniqueId: json["waste_clt_unique_id"],
        staffName: json["staff_name"] == null ? null : json["staff_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "waste_clt_date": wasteCltDate,
        "waste_clt_time": wasteCltTime,
        "waste_clt_total_amount": wasteCltTotalAmount,
        "waste_clt_unique_id": wasteCltUniqueId,
        "staff_name": staffName == null ? null : staffName,
    };
}

class Statement {
    Statement({
        this.id,
        this.vcountMonthDue,
        this.vcountMonthDueUnchanged,
        this.date,
        this.statementType,
        this.referenceNo,
        this.balance,
    });

    String? id;
    int? vcountMonthDue;
    int? vcountMonthDueUnchanged;
    String? date;
    String? statementType;
    String? referenceNo;
    String? balance;

    factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        id: json["_id"],
        vcountMonthDue: json["vcount_month_due"],
        vcountMonthDueUnchanged: json["vcount_month_due_unchanged"],
        date: json["date"],
        statementType: json["statement_type"],
        referenceNo: json["reference_no"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "vcount_month_due": vcountMonthDue,
        "vcount_month_due_unchanged": vcountMonthDueUnchanged,
        "date": date,
        "statement_type": statementType,
        "reference_no": referenceNo,
        "balance": balance,
    };
}
