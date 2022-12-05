// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) => NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) => json.encode(data.toJson());

class NotificationListModel {
    NotificationListModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
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
        this.notificationTitle,
        this.notificationMessage,
        this.notificationImage,
        this.notificationUrl,
        this.notificationDate,
        this.notificationTime,
    });

    String? id;
    String? notificationTitle;
    String? notificationMessage;
    String? notificationImage;
    String? notificationUrl;
    DateTime? notificationDate;
    String? notificationTime;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        notificationTitle: json["notification_title"],
        notificationMessage: json["notification_message"],
        notificationImage: json["notification_image"] == null ? null : json["notification_image"],
        notificationUrl: json["notification_url"] == null ? null : json["notification_url"],
        notificationDate: json["notification_date"] == null ? null : DateTime.parse(json["notification_date"]),
        notificationTime: json["notification_time"] == null ? null : json["notification_time"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "notification_title": notificationTitle,
        "notification_message": notificationMessage,
        "notification_image": notificationImage == null ? null : notificationImage,
        "notification_url": notificationUrl == null ? null : notificationUrl,
        "notification_date": notificationDate == null ? null : "${notificationDate!.year.toString().padLeft(4, '0')}-${notificationDate!.month.toString().padLeft(2, '0')}-${notificationDate!.day.toString().padLeft(2, '0')}",
        "notification_time": notificationTime == null ? null : notificationTime,
    };
}
