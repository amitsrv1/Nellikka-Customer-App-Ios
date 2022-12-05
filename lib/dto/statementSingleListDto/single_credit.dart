// To parse this JSON data, do
//
//     final singleCreditNoteModel = singleCreditNoteModelFromJson(jsonString);

import 'dart:convert';

SingleCreditNoteModel singleCreditNoteModelFromJson(String str) => SingleCreditNoteModel.fromJson(json.decode(str));

String singleCreditNoteModelToJson(SingleCreditNoteModel data) => json.encode(data.toJson());

class SingleCreditNoteModel {
    SingleCreditNoteModel({
        this.success,
        this.statement,
        this.data,
    });

    bool? success;
    Statement? statement;
    List<Datum>? data;

    factory SingleCreditNoteModel.fromJson(Map<String, dynamic> json) => SingleCreditNoteModel(
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
        this.creditNoteStatus,
        this.creditNoteCustGroup,
        this.creditNoteDate,
        this.creditNoteTime,
        this.creditNoteCustReg,
        this.creditNoteCustId,
        this.creditNoteCustName,
        this.creditNoteCustWard,
        this.creditNoteCreditamt,
        this.creditNoteDueamt,
        this.creditNoteComment,
        this.creditNoteBalance,
        this.creditNoteAddedBy,
        this.creditNoteCustLocalbody,
        this.creditNoteRegNo,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.staffInfo,
    });

    String? id;
    int? creditNoteStatus;
    List<String>? creditNoteCustGroup;
    DateTime? creditNoteDate;
    String? creditNoteTime;
    String? creditNoteCustReg;
    String? creditNoteCustId;
    String? creditNoteCustName;
    String? creditNoteCustWard;
    String? creditNoteCreditamt;
    String? creditNoteDueamt;
    String? creditNoteComment;
    String? creditNoteBalance;
    String? creditNoteAddedBy;
    String? creditNoteCustLocalbody;
    String? creditNoteRegNo;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    List<StaffInfo>? staffInfo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        creditNoteStatus: json["credit_note_status"],
        creditNoteCustGroup: List<String>.from(json["credit_note_cust_group"].map((x) => x)),
        creditNoteDate: DateTime.parse(json["credit_note_date"]),
        creditNoteTime: json["credit_note_time"],
        creditNoteCustReg: json["credit_note_cust_reg"],
        creditNoteCustId: json["credit_note_cust_id"],
        creditNoteCustName: json["credit_note_cust_name"],
        creditNoteCustWard: json["credit_note_cust_ward"],
        creditNoteCreditamt: json["credit_note_creditamt"],
        creditNoteDueamt: json["credit_note_dueamt"],
        creditNoteComment: json["credit_note_comment"],
        creditNoteBalance: json["credit_note_balance"],
        creditNoteAddedBy: json["credit_note_added_by"],
        creditNoteCustLocalbody: json["credit_note_cust_localbody"],
        creditNoteRegNo: json["credit_note_reg_no"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        staffInfo: List<StaffInfo>.from(json["staff_info"].map((x) => StaffInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "credit_note_status": creditNoteStatus,
        "credit_note_cust_group": List<dynamic>.from(creditNoteCustGroup!.map((x) => x)),
        "credit_note_date": "${creditNoteDate?.year.toString().padLeft(4, '0')}-${creditNoteDate?.month.toString().padLeft(2, '0')}-${creditNoteDate?.day.toString().padLeft(2, '0')}",
        "credit_note_time": creditNoteTime,
        "credit_note_cust_reg": creditNoteCustReg,
        "credit_note_cust_id": creditNoteCustId,
        "credit_note_cust_name": creditNoteCustName,
        "credit_note_cust_ward": creditNoteCustWard,
        "credit_note_creditamt": creditNoteCreditamt,
        "credit_note_dueamt": creditNoteDueamt,
        "credit_note_comment": creditNoteComment,
        "credit_note_balance": creditNoteBalance,
        "credit_note_added_by": creditNoteAddedBy,
        "credit_note_cust_localbody": creditNoteCustLocalbody,
        "credit_note_reg_no": creditNoteRegNo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
