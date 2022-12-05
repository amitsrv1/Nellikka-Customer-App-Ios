// To parse this JSON data, do
//
//     final wasteRequestItemModel = wasteRequestItemModelFromJson(jsonString);

import 'dart:convert';

WasteRequestItemModel wasteRequestItemModelFromJson(String str) => WasteRequestItemModel.fromJson(json.decode(str));

String wasteRequestItemModelToJson(WasteRequestItemModel data) => json.encode(data.toJson());

class WasteRequestItemModel {
    WasteRequestItemModel({
        this.status,
        this.data,
    });

    int? status;
    List<Datum>? data;

    factory WasteRequestItemModel.fromJson(Map<String, dynamic> json) => WasteRequestItemModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.wasteItemsName,
    });

    String? id;
    String? wasteItemsName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        wasteItemsName: json["waste_items_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "waste_items_name": wasteItemsName,
    };
}
