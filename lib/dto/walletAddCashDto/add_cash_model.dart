// To parse this JSON data, do
//
//     final addWalletModel = addWalletModelFromJson(jsonString);

import 'dart:convert';

AddWalletModel addWalletModelFromJson(String str) => AddWalletModel.fromJson(json.decode(str));

String addWalletModelToJson(AddWalletModel data) => json.encode(data.toJson());

class AddWalletModel {
    AddWalletModel({
        this.success,
        this.data,
    });

    bool? success;
    Data? data;

    factory AddWalletModel.fromJson(Map<String, dynamic> json) => AddWalletModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.status,
        this.id,
        this.ip,
        this.date,
        this.time,
        this.customerId,
        this.amount,
        this.customerName,
        this.customerMobile,
        this.customerEmail,
        this.transactionId,
        this.currency,
        this.paymentResponseStatus,
        this.paymentResponseMessage,
        this.paymentGatewayName,
        this.razorpayId,
        this.uniqueId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    int? status;
    String? id;
    String? ip;
    DateTime? date;
    String? time;
    String? customerId;
    String? amount;
    String? customerName;
    String? customerMobile;
    String? customerEmail;
    String? transactionId;
    String? currency;
    String? paymentResponseStatus;
    String? paymentResponseMessage;
    String? paymentGatewayName;
    String? razorpayId;
    String? uniqueId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        id: json["_id"],
        ip: json["_ip"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        customerId: json["customer_id"],
        amount: json["amount"],
        customerName: json["customer_name"],
        customerMobile: json["customer_mobile"],
        customerEmail: json["customer_email"],
        transactionId: json["transaction_id"],
        currency: json["currency"],
        paymentResponseStatus: json["payment_response_status"],
        paymentResponseMessage: json["payment_response_message"],
        paymentGatewayName: json["payment_gateway_name"],
        razorpayId: json["razorpay_id"],
        uniqueId: json["unique_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "_ip": ip,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "customer_id": customerId,
        "amount": amount,
        "customer_name": customerName,
        "customer_mobile": customerMobile,
        "customer_email": customerEmail,
        "transaction_id": transactionId,
        "currency": currency,
        "payment_response_status": paymentResponseStatus,
        "payment_response_message": paymentResponseMessage,
        "payment_gateway_name": paymentGatewayName,
        "razorpay_id": razorpayId,
        "unique_id": uniqueId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
