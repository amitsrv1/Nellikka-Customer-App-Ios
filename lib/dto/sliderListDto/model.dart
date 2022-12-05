// To parse this JSON data, do
//
//     final sliderList = sliderListFromJson(jsonString);

import 'dart:convert';

SliderList sliderListFromJson(String str) => SliderList.fromJson(json.decode(str));

String sliderListToJson(SliderList data) => json.encode(data.toJson());

class SliderList {
    SliderList({
        this.success,
        this.data,
    });

    bool? success;
    List<Datum>? data;

    factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
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
        this.name,
        this.image,
    });

    String? id;
    String? name;
    String? image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
    };
}
