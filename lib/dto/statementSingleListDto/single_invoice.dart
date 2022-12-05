// To parse this JSON data, do
//
//     final singleInvoice = singleInvoiceFromJson(jsonString);

import 'dart:convert';

SingleInvoice singleInvoiceFromJson(String str) => SingleInvoice.fromJson(json.decode(str));

String singleInvoiceToJson(SingleInvoice data) => json.encode(data.toJson());

class SingleInvoice {
    SingleInvoice({
        this.success,
        this.statement,
        this.data,
    });

    bool? success;
    Statement? statement;
    List<Datum>? data;

    factory SingleInvoice.fromJson(Map<String, dynamic> json) => SingleInvoice(
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
        this.invoiceDate,
        this.invoiceTime,
        this.invoiceTotalAmt,
        this.invoiceNo,
        this.staffInfo,
    });

    String? id;
    DateTime? invoiceDate;
    String? invoiceTime;
    int? invoiceTotalAmt;
    String? invoiceNo;
    List<StaffInfo>? staffInfo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        invoiceDate: DateTime.parse(json["invoice_date"]),
        invoiceTime: json["invoice_time"],
        invoiceTotalAmt: json["invoice_total_amt"],
        invoiceNo: json["invoice_no"],
        staffInfo: List<StaffInfo>.from(json["staff_info"].map((x) => StaffInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "invoice_date": "${invoiceDate?.year.toString().padLeft(4, '0')}-${invoiceDate?.month.toString().padLeft(2, '0')}-${invoiceDate?.day.toString().padLeft(2, '0')}",
        "invoice_time": invoiceTime,
        "invoice_total_amt": invoiceTotalAmt,
        "invoice_no": invoiceNo,
        "staff_info": List<dynamic>.from(staffInfo!.map((x) => x.toJson())),
    };
}

class StaffInfo {
    StaffInfo({
        this.id,
        this.firstName,
        this.lastName,
    });

    String? id;
    String? firstName;
    String? lastName;

    factory StaffInfo.fromJson(Map<String, dynamic> json) => StaffInfo(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
    };
}

class Statement {
    Statement({
        this.status,
        this.id,
        this.statementIp,
        this.statementAddedby,
        this.date,
        this.time,
        this.customerId,
        this.statementType,
        this.referenceId,
        this.referenceNo,
        this.credit,
        this.debit,
        this.walletUsage,
        this.balance,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    int? status;
    String? id;
    String? statementIp;
    String? statementAddedby;
    DateTime? date;
    String? time;
    String? customerId;
    String? statementType;
    String? referenceId;
    String? referenceNo;
    int? credit;
    int? debit;
    int? walletUsage;
    int? balance;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        status: json["status"],
        id: json["_id"],
        statementIp: json["statement_ip"],
        statementAddedby: json["statement_addedby"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        customerId: json["customer_id"],
        statementType: json["statement_type"],
        referenceId: json["reference_id"],
        referenceNo: json["reference_no"],
        credit: json["credit"],
        debit: json["debit"],
        walletUsage: json["wallet_usage"],
        balance: json["balance"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "statement_ip": statementIp,
        "statement_addedby": statementAddedby,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "customer_id": customerId,
        "statement_type": statementType,
        "reference_id": referenceId,
        "reference_no": referenceNo,
        "credit": credit,
        "debit": debit,
        "wallet_usage": walletUsage,
        "balance": balance,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
