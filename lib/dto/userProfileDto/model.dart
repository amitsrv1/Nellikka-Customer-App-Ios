// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
    UserDetailsModel({
        this.success,
        this.result,
    });

    bool? success;
    Result? result;

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        success: json["success"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": result!.toJson(),
    };
}

class Result {
    Result({
        this.id,
        this.custRegNo,
        this.custName,
        this.custAddress,
        this.custAddress1,
        this.district,
        this.custHouseNum,
        this.custPhone,
        this.custImage,
        this.custLandlineNo,
        this.custWhatsappNo,
        this.custEmail,
        this.custNoMembers,
        this.custQrCode,
        this.custLatitude,
        this.custLongitude,
        this.custVerificationStatus,
        this.custDue,
        this.custWallet,
        this.localBody,
        this.wardData,
        this.groupData,
        this.packageData,
        this.districtName,
        this.designation,
        this.designationName,
        this.customerType,
        this.customerTypeName,
        this.billingTypeId,
        this.billingTypeName,
        this.packageId,
        this.packageName,
    });

    String? id;
    String? custRegNo;
    String? custName;
    String? custAddress;
    String? custAddress1;
    String? district;
    String? custHouseNum;
    String? custPhone;
    String? custImage;
    String? custLandlineNo;
    String? custWhatsappNo;
    String? custEmail;
    int? custNoMembers;
    String? custQrCode;
    String? custLatitude;
    String? custLongitude;
    int? custVerificationStatus;
    String? custDue;
    String? custWallet;
    List<LocalBody>? localBody;
    List<WardDatum>? wardData;
    List<GroupDatum>? groupData;
    List<PackageDatum>? packageData;
    String? districtName;
    String? designation;
    String? designationName;
    String? customerType;
    String? customerTypeName;
    String? billingTypeId;
    String? billingTypeName;
    String? packageId;
    String? packageName;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        custRegNo: json["cust_reg_no"],
        custName: json["cust_name"],
        custAddress: json["cust_address"],
        custAddress1: json["cust_address1"],
        district: json["district"],
        custHouseNum: json["cust_house_num"],
        custPhone: json["cust_phone"],
        custImage: json["cust_image"],
        custLandlineNo: json["cust_landline_no"],
        custWhatsappNo: json["cust_whatsapp_no"],
        custEmail: json["cust_email"],
        custNoMembers: json["cust_no_members"],
        custQrCode: json["cust_qr_code"],
        custLatitude: json["cust_latitude"],
        custLongitude: json["cust_longitude"],
        custVerificationStatus: json["cust_verification_status"],
        custDue: json["cust_due"],
        custWallet: json["cust_wallet"],
        localBody: List<LocalBody>.from(json["local_body"].map((x) => LocalBody.fromJson(x))),
        wardData: List<WardDatum>.from(json["ward_data"].map((x) => WardDatum.fromJson(x))),
        groupData: List<GroupDatum>.from(json["group_data"].map((x) => GroupDatum.fromJson(x))),
        packageData: List<PackageDatum>.from(json["package_data"].map((x) => PackageDatum.fromJson(x))),
        districtName: json["district_name"],
        designation: json["designation"],
        designationName: json["designation_name"],
        customerType: json["customer_type"],
        customerTypeName: json["customer_type_name"],
        billingTypeId: json["billing_type_id"],
        billingTypeName: json["billing_type_name"],
        packageId: json["package_id"],
        packageName: json["package_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cust_reg_no": custRegNo,
        "cust_name": custName,
        "cust_address": custAddress,
        "cust_address1": custAddress1,
        "district": district,
        "cust_house_num": custHouseNum,
        "cust_phone": custPhone,
        "cust_image": custImage,
        "cust_landline_no": custLandlineNo,
        "cust_whatsapp_no": custWhatsappNo,
        "cust_email": custEmail,
        "cust_no_members": custNoMembers,
        "cust_qr_code": custQrCode,
        "cust_latitude": custLatitude,
        "cust_longitude": custLongitude,
        "cust_verification_status": custVerificationStatus,
        "cust_due": custDue,
        "cust_wallet": custWallet,
        "local_body": List<dynamic>.from(localBody!.map((x) => x.toJson())),
        "ward_data": List<dynamic>.from(wardData!.map((x) => x.toJson())),
        "group_data": List<dynamic>.from(groupData!.map((x) => x.toJson())),
        "package_data": List<dynamic>.from(packageData!.map((x) => x.toJson())),
        "district_name": districtName,
        "designation": designation,
        "designation_name": designationName,
        "customer_type": customerType,
        "customer_type_name": customerTypeName,
        "billing_type_id": billingTypeId,
        "billing_type_name": billingTypeName,
        "package_id": packageId,
        "package_name": packageName,
    };
}

class GroupDatum {
    GroupDatum({
        this.id,
        this.groupName,
    });

    String? id;
    String? groupName;

    factory GroupDatum.fromJson(Map<String, dynamic> json) => GroupDatum(
        id: json["_id"],
        groupName: json["group_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "group_name": groupName,
    };
}

class LocalBody {
    LocalBody({
        this.id,
        this.localbodyName,
        this.localBodyId,
        this.localbodyTypeName,
    });

    String? id;
    String? localbodyName;
    String? localBodyId;
    String? localbodyTypeName;

    factory LocalBody.fromJson(Map<String, dynamic> json) => LocalBody(
        id: json["_id"],
        localbodyName: json["localbody_name"],
        localBodyId: json["local_body_id"],
        localbodyTypeName: json["localbody_type_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "localbody_name": localbodyName,
        "local_body_id": localBodyId,
        "localbody_type_name": localbodyTypeName,
    };
}

class PackageDatum {
    PackageDatum({
        this.id,
        this.tariffAssignIp,
        this.tariffAssignStatus,
        this.tariffAssignAddedby,
        this.tariffAssignDate,
        this.tariffAssignTime,
        this.tariffAssignCompany,
        this.tariffAssignCustomerId,
        this.tariffAssignPackId,
        this.tariffAssignActiveStatus,
        this.tariffAssignId,
        this.tariffRegNumber,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.tblTariff,
    });

    String? id;
    String? tariffAssignIp;
    int? tariffAssignStatus;
    String? tariffAssignAddedby;
    DateTime? tariffAssignDate;
    String? tariffAssignTime;
    String? tariffAssignCompany;
    String? tariffAssignCustomerId;
    String? tariffAssignPackId;
    int? tariffAssignActiveStatus;
    int? tariffAssignId;
    String? tariffRegNumber;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    List<TblTariff>? tblTariff;

    factory PackageDatum.fromJson(Map<String, dynamic> json) => PackageDatum(
        id: json["_id"],
        tariffAssignIp: json["tariff_assign_ip"],
        tariffAssignStatus: json["tariff_assign_status"],
        tariffAssignAddedby: json["tariff_assign_addedby"],
        tariffAssignDate: DateTime.parse(json["tariff_assign_date"]),
        tariffAssignTime: json["tariff_assign_time"],
        tariffAssignCompany: json["tariff_assign_company"],
        tariffAssignCustomerId: json["tariff_assign_customer_id"],
        tariffAssignPackId: json["tariff_assign_pack_id"],
        tariffAssignActiveStatus: json["tariff_assign_active_status"],
        tariffAssignId: json["tariff_assign_id"],
        tariffRegNumber: json["tariff_reg_number"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        tblTariff: List<TblTariff>.from(json["tbl_tariff"].map((x) => TblTariff.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tariff_assign_ip": tariffAssignIp,
        "tariff_assign_status": tariffAssignStatus,
        "tariff_assign_addedby": tariffAssignAddedby,
        "tariff_assign_date": "${tariffAssignDate?.year.toString().padLeft(4, '0')}-${tariffAssignDate?.month.toString().padLeft(2, '0')}-${tariffAssignDate?.day.toString().padLeft(2, '0')}",
        "tariff_assign_time": tariffAssignTime,
        "tariff_assign_company": tariffAssignCompany,
        "tariff_assign_customer_id": tariffAssignCustomerId,
        "tariff_assign_pack_id": tariffAssignPackId,
        "tariff_assign_active_status": tariffAssignActiveStatus,
        "tariff_assign_id": tariffAssignId,
        "tariff_reg_number": tariffRegNumber,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "tbl_tariff": List<dynamic>.from(tblTariff!.map((x) => x.toJson())),
    };
}

class TblTariff {
    TblTariff({
        this.id,
        this.tariffId,
        this.tariffIp,
        this.tariffStatus,
        this.tariffAddedby,
        this.tariffDate,
        this.tariffTime,
        this.tariffCompany,
        this.localbodyTypeOld,
        this.localbodyNameOld,
        this.packageName,
        this.custType,
        this.packageRegFee,
        this.packageBasicFee,
        this.packageTotatAmount,
        this.packageValidity,
        this.packageVisitMonth,
        this.packageBillingIdOld,
        this.packageBagsOld,
        this.totalFreeBags,
        this.packageActiveStatus,
        this.tariffIdOld,
        this.localbodyName,
        this.localbodyType,
        this.packageBags,
        this.packageBillingId,
        this.updatedAt,
        this.tariffUpdatedby,
    });

    String? id;
    int? tariffId;
    String? tariffIp;
    int? tariffStatus;
    String? tariffAddedby;
    DateTime? tariffDate;
    String? tariffTime;
    String? tariffCompany;
    int? localbodyTypeOld;
    int? localbodyNameOld;
    String? packageName;
    String? custType;
    int? packageRegFee;
    int? packageBasicFee;
    int? packageTotatAmount;
    int? packageValidity;
    int? packageVisitMonth;
    String? packageBillingIdOld;
    String? packageBagsOld;
    int? totalFreeBags;
    int? packageActiveStatus;
    int? tariffIdOld;
    String? localbodyName;
    String? localbodyType;
    List<int>? packageBags;
    List<String>? packageBillingId;
    DateTime? updatedAt;
    String? tariffUpdatedby;

    factory TblTariff.fromJson(Map<String, dynamic> json) => TblTariff(
        id: json["_id"],
        tariffId: json["tariff_id"],
        tariffIp: json["tariff_ip"],
        tariffStatus: json["tariff_status"],
        tariffAddedby: json["tariff_addedby"],
        tariffDate: DateTime.parse(json["tariff_date"]),
        tariffTime: json["tariff_time"],
        tariffCompany: json["tariff_company"],
        localbodyTypeOld: json["localbody_type_old"],
        localbodyNameOld: json["localbody_name_old"],
        packageName: json["package_name"],
        custType: json["cust_type"],
        packageRegFee: json["package_reg_fee"],
        packageBasicFee: json["package_basic_fee"],
        packageTotatAmount: json["package_totat_amount"],
        packageValidity: json["package_validity"],
        packageVisitMonth: json["package_visit_month"],
        packageBillingIdOld: json["package_billing_id_old"],
        packageBagsOld: json["package_bags_old"],
        totalFreeBags: json["total_free_bags"],
        packageActiveStatus: json["package_active_status"],
        tariffIdOld: json["tariff_id_old"],
        localbodyName: json["localbody_name"],
        localbodyType: json["localbody_type"],
        packageBags: List<int>.from(json["package_bags"].map((x) => x)),
        packageBillingId: List<String>.from(json["package_billing_id"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tariffUpdatedby: json["tariff_updatedby"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tariff_id": tariffId,
        "tariff_ip": tariffIp,
        "tariff_status": tariffStatus,
        "tariff_addedby": tariffAddedby,
        "tariff_date": "${tariffDate?.year.toString().padLeft(4, '0')}-${tariffDate?.month.toString().padLeft(2, '0')}-${tariffDate?.day.toString().padLeft(2, '0')}",
        "tariff_time": tariffTime,
        "tariff_company": tariffCompany,
        "localbody_type_old": localbodyTypeOld,
        "localbody_name_old": localbodyNameOld,
        "package_name": packageName,
        "cust_type": custType,
        "package_reg_fee": packageRegFee,
        "package_basic_fee": packageBasicFee,
        "package_totat_amount": packageTotatAmount,
        "package_validity": packageValidity,
        "package_visit_month": packageVisitMonth,
        "package_billing_id_old": packageBillingIdOld,
        "package_bags_old": packageBagsOld,
        "total_free_bags": totalFreeBags,
        "package_active_status": packageActiveStatus,
        "tariff_id_old": tariffIdOld,
        "localbody_name": localbodyName,
        "localbody_type": localbodyType,
        "package_bags": List<dynamic>.from(packageBags!.map((x) => x)),
        "package_billing_id": List<dynamic>.from(packageBillingId!.map((x) => x)),
        "updatedAt": updatedAt!.toIso8601String(),
        "tariff_updatedby": tariffUpdatedby,
    };
}

class WardDatum {
    WardDatum({
        this.id,
        this.wardName,
    });

    String? id;
    String? wardName;

    factory WardDatum.fromJson(Map<String, dynamic> json) => WardDatum(
        id: json["_id"],
        wardName: json["ward_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ward_name": wardName,
    };
}
