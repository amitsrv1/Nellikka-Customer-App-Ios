// To parse this JSON data, do
//
//     final complaintListModel = complaintListModelFromJson(jsonString);

import 'dart:convert';

ComplaintListModel complaintListModelFromJson(String str) => ComplaintListModel.fromJson(json.decode(str));

String complaintListModelToJson(ComplaintListModel data) => json.encode(data.toJson());

class ComplaintListModel {
    ComplaintListModel({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory ComplaintListModel.fromJson(Map<String, dynamic> json) => ComplaintListModel(
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
        this.complaintActivestatus,
        this.image,
        this.time,
        this.complaintId,
        this.followupDetails,
        this.complaintDate,
        this.staffId,
        this.type,
    });

    String? id;
    int? complaintActivestatus;
    List<String>? image;
    String? time;
    String? complaintId;
    List<FollowupDetail>? followupDetails;
    String? complaintDate;
    String? staffId;
    String? type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        complaintActivestatus: json["complaint_activestatus"],
        image: List<String>.from(json["image"].map((x) => x)),
        time: json["time"],
        complaintId: json["complaint_id"],
        followupDetails: List<FollowupDetail>.from(json["followup_details"].map((x) => FollowupDetail.fromJson(x))),
        complaintDate: json["complaint_date"],
        staffId: json["staff_id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "complaint_activestatus": complaintActivestatus,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "time": time,
        "complaint_id": complaintId,
        "followup_details": List<dynamic>.from(followupDetails!.map((x) => x.toJson())),
        "complaint_date": complaintDate,
        "staff_id": staffId,
        "type": type,
    };
}

class FollowupDetail {
    FollowupDetail({
        this.id,
        this.followupComment,
        this.followupTime,
        this.folloupUser,
        this.followupDate,
    });

    String? id;
    String? followupComment;
    String? followupTime;
    String? folloupUser;
    String? followupDate;

    factory FollowupDetail.fromJson(Map<String, dynamic> json) => FollowupDetail(
        id: json["_id"],
        followupComment: json["followup_comment"],
        followupTime: json["followup_time"],
        folloupUser: json["folloup_user"],
        followupDate: json["followup_date"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "followup_comment": followupComment,
        "followup_time": followupTime,
        "folloup_user": folloupUser,
        "followup_date": followupDate,
    };
}
