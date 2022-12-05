// To parse this JSON data, do
//
//     final statementSingleList = statementSingleListFromJson(jsonString);

import 'dart:convert';

StatementSingleList statementSingleListFromJson(String str) => StatementSingleList.fromJson(json.decode(str));

String statementSingleListToJson(StatementSingleList data) => json.encode(data.toJson());

class StatementSingleList {
    StatementSingleList({
        this.success,
        this.statement,
        this.data,
    });

    bool? success;
    Statement? statement;
    List<Datum>? data;

    factory StatementSingleList.fromJson(Map<String, dynamic> json) => StatementSingleList(
        success: json["success"],
        statement: Statement.fromJson(json["statement"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statement": statement!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.receiptId,
        this.receiptIp,
        this.receiptStatus,
        this.createdAt,
        this.updatedAt,
        this.receiptAddedby,
        this.receiptNo,
        this.receiptDate,
        this.receiptTime,
        this.receiptCustId,
        this.receiptCustName,
        this.receiptCustGroupid,
        this.receiptCustWardid,
        this.receiptAmount,
        this.receiptDueAmt,
        this.pdfLink,
        this.receiptEditedby,
        this.receiptEditedDate,
        this.staffInfo,
        this.customerInfo,
        this.paymentInfo,
    });

    String? id;
    int? receiptId;
    String? receiptIp;
    int? receiptStatus;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? receiptAddedby;
    String? receiptNo;
    DateTime? receiptDate;
    String? receiptTime;
    String? receiptCustId;
    String? receiptCustName;
    int? receiptCustGroupid;
    int? receiptCustWardid;
    int? receiptAmount;
    int? receiptDueAmt;
    String? pdfLink;
    int? receiptEditedby;
    dynamic? receiptEditedDate;
    List<StaffInfo>? staffInfo;
    List<CustomerInfo>? customerInfo;
    List<dynamic>? paymentInfo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        receiptId: json["receipt_id"],
        receiptIp: json["receipt_ip"],
        receiptStatus: json["receipt_status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        receiptAddedby: json["receipt_addedby"],
        receiptNo: json["receipt_no"],
        receiptDate: DateTime.parse(json["receipt_date"]),
        receiptTime: json["receipt_time"],
        receiptCustId: json["receipt_cust_id"],
        receiptCustName: json["receipt_cust_name"],
        receiptCustGroupid: json["receipt_cust_groupid"],
        receiptCustWardid: json["receipt_cust_wardid"],
        receiptAmount: json["reciept_amount"],
        receiptDueAmt: json["receipt_due_amt"],
        pdfLink: json["pdf_link"],
        receiptEditedby: json["receipt_editedby"],
        receiptEditedDate: json["receipt_edited_date"],
        staffInfo: List<StaffInfo>.from(json["staff_info"].map((x) => StaffInfo.fromJson(x))),
       // customerInfo: List<CustomerInfo>.from(json["customer_info"].map((x) => CustomerInfo.fromJson(x))),
       // paymentInfo: List<dynamic>.from(json["payment_info"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "receipt_id": receiptId,
        "receipt_ip": receiptIp,
        "receipt_status": receiptStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "receipt_addedby": receiptAddedby,
        "receipt_no": receiptNo,
        "receipt_date": receiptDate?.toIso8601String(),
        "receipt_time": receiptTime,
        "receipt_cust_id": receiptCustId,
        "receipt_cust_name": receiptCustName,
        "receipt_cust_groupid": receiptCustGroupid,
        "receipt_cust_wardid": receiptCustWardid,
        "receipt_amount": receiptAmount,
        "receipt_due_amt": receiptDueAmt,
        "pdf_link": pdfLink,
        "receipt_editedby": receiptEditedby,
        "receipt_edited_date": receiptEditedDate,
        "staff_info": List<dynamic>.from(staffInfo!.map((x) => x.toJson())),
        "customer_info": List<dynamic>.from(customerInfo!.map((x) => x.toJson())),
        "payment_info": List<dynamic>.from(paymentInfo!.map((x) => x)),
    };
}

class CustomerInfo {
    CustomerInfo({
        this.id,
        this.custName,
    });

    String? id;
    String? custName;

    factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        id: json["_id"],
        custName: json["cust_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cust_name": custName,
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
