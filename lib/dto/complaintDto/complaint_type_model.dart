// To parse this JSON data, do
//
//     final complaintTypeModel = complaintTypeModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/material/dropdown.dart';

ComplaintTypeModel complaintTypeModelFromJson(String str) => ComplaintTypeModel.fromJson(json.decode(str));

String complaintTypeModelToJson(ComplaintTypeModel data) => json.encode(data.toJson());

class ComplaintTypeModel {
    ComplaintTypeModel({
        this.success,
        this.data,
    });

    bool? success;
    List<CatgDatum>? data;

    factory ComplaintTypeModel.fromJson(Map<String, dynamic> json) => ComplaintTypeModel(
        success: json["success"],
        data: List<CatgDatum>.from(json["data"].map((x) => CatgDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };

  map(DropdownMenuItem<Object> Function(dynamic value) param0) {}
}

class CatgDatum {
    CatgDatum({
        this.id,
        this.name,
    });

    String? id;
    String? name;

    factory CatgDatum.fromJson(Map<String, dynamic> json) => CatgDatum(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };

  map(DropdownMenuItem<Object> Function(dynamic value) param0) {}
}
