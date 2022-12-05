// To parse this JSON data, do
//
//     final walletLogModel = walletLogModelFromJson(jsonString);

import 'dart:convert';

WalletLogModel walletLogModelFromJson(String str) =>
    WalletLogModel.fromJson(json.decode(str));

String walletLogModelToJson(WalletLogModel data) => json.encode(data.toJson());

class WalletLogModel {
  WalletLogModel({
    this.success,
    this.walletLog,
    this.custWalletBalance,
    this.totalCredit,
    this.totalDebit,
  });

  bool? success;
  List<WalletLog>? walletLog;
  String? custWalletBalance;
  int? totalCredit;
  int? totalDebit;

  factory WalletLogModel.fromJson(Map<String, dynamic> json) => WalletLogModel(
        success: json["success"],
        walletLog: List<WalletLog>.from(
            json["wallet_log"].map((x) => WalletLog.fromJson(x))),
        custWalletBalance: json["cust_wallet_balance"],
        totalCredit: json["Total_credit"],
        totalDebit: json["Total_debit"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "wallet_log": List<dynamic>.from(walletLog!.map((x) => x.toJson())),
        "cust_wallet_balance": custWalletBalance,
        "Total_credit": totalCredit,
        "Total_debit": totalDebit,
      };
}

class WalletLog {
  WalletLog({
    this.id,
    this.wlogAmount,
    this.wlogType,
    this.wlogMessage,
    this.wlogTime,
    this.date,
  });

  String? id;
  String? wlogAmount;
  int? wlogType;
  String? wlogMessage;
  String? wlogTime;
  String? date;

  factory WalletLog.fromJson(Map<String, dynamic> json) => WalletLog(
        id: json["_id"],
        wlogAmount: json["wlog_amount"],
        wlogType: json["wlog_type"],
        wlogMessage: json["wlog_message"],
        wlogTime: json["wlog_time"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "wlog_amount": wlogAmount,
        "wlog_type": wlogType,
        "wlog_message": wlogMessage,
        "wlog_time": wlogTime,
        "date": date,
      };
}
