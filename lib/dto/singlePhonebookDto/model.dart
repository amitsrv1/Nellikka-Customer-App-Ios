class SinglePhonebookModel {
  SinglePhonebookModel({
    this.success,
    this.data,
  });

  SinglePhonebookModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Datum.fromJson(v));
      });
    }
  }
  bool? success;
  List<Datum>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.address,
    this.userImage,
    this.post,
    this.company,
    this.salary,
    this.ward,
  });

  Datum.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    userImage = json['user_image'];
    post = json['post'];
    company = json['company'];
    salary = json['salary'];
    if (json['ward'] != null) {
      ward = [];
      json['ward'].forEach((v) {
        ward?.add(Ward.fromJson(v));
      });
    }
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? address;
  String? userImage;
  String? post;
  String? company;
  String? salary;
  List<Ward>? ward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['mobile'] = mobile;
    map['address'] = address;
    map['user_image'] = userImage;
    map['post'] = post;
    map['company'] = company;
    map['salary'] = salary;
    return map;
  }

}
class Ward {
  Ward({
    this.wardId,
    this.wardName,
  });

  Ward.fromJson(dynamic json) {
    wardId = json['_id'];
    wardName = json['ward_name'];
  }
  String? wardId;
  String? wardName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = wardId;
    map['ward_name'] = wardName;
    return map;
  }
}
