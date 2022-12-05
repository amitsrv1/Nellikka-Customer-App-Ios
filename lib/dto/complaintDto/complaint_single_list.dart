// To parse this JSON data, do
//
//     final complaintSingleList = complaintSingleListFromJson(jsonString);

// import 'dart:convert';

// ComplaintSingleList complaintSingleListFromJson(String str) => ComplaintSingleList.fromJson(json.decode(str));

// String complaintSingleListToJson(ComplaintSingleList data) => json.encode(data.toJson());

// class ComplaintSingleList {
//     ComplaintSingleList({
//         this.success,
//         this.data,
//     });

//     bool? success;
//     Data? data;

//     factory ComplaintSingleList.fromJson(Map<String, dynamic> json) => ComplaintSingleList(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data?.toJson(),
//     };
// }

// class Data {
//     Data({
//         this.id,
//         this.complaintActivestatus,
//         this.time,
//         this.complaintId,
//         this.followupDetails,
//         this.complaintDate,
//         this.staffId,
//         this.type,
//     });

//     String? id;
//     int? complaintActivestatus;
//     String? time;
//     String? complaintId;
//     List<FollowupDetail>? followupDetails;
//     String? complaintDate;
//     String? staffId;
//     String? type;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["_id"],
//         complaintActivestatus: json["complaint_activestatus"],
//         time: json["time"],
//         complaintId: json["complaint_id"],
//         followupDetails: List<FollowupDetail>.from(json["followup_details"].map((x) => FollowupDetail.fromJson(x))),
//         complaintDate: json["complaint_date"],
//         staffId: json["staff_id"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "complaint_activestatus": complaintActivestatus,
//         "time": time,
//         "complaint_id": complaintId,
//         "followup_details": List<dynamic>.from(followupDetails!.map((x) => x.toJson())),
//         "complaint_date": complaintDate,
//         "staff_id": staffId,
//         "type": type,
//     };
// }

// class FollowupDetail {
//     FollowupDetail({
//         this.id,
//         this.followupComment,
//         this.followupTime,
//         this.folloupUser,
//         this.followupDate,
//     });

//     String? id;
//     String? followupComment;
//     String? followupTime;
//     String? folloupUser;
//     String? followupDate;

//     factory FollowupDetail.fromJson(Map<String, dynamic> json) => FollowupDetail(
//         id: json["_id"],
//         followupComment: json["followup_comment"],
//         followupTime: json["followup_time"],
//         folloupUser: json["folloup_user"],
//         followupDate: json["followup_date"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "followup_comment": followupComment,
//         "followup_time": followupTime,
//         "folloup_user": folloupUser,
//         "followup_date": followupDate,
//     };
// }
