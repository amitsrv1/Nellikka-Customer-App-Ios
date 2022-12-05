import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/staffListDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';

class StaffListController extends GetxController {
  List<StaffDatum>? staffData;

  final ApiBaseHelper _helper = ApiBaseHelper();

  bool loadingPage = false;

  var priority = 'High';
  StaffListModel staffListModel = StaffListModel();

  getStaffList() async {
    loadingPage = true;
    update();
    final response = await _helper.get(
      "https://nodeapi$linkStatus.nellikkastore.com/user/localbody?localbody_id=${UserInformation.read('local_body_id')}",
      UserInformation.read('access_token'),
    );
    if (response["success"] == true) {
      loadingPage = false;
      update();
      staffListModel = StaffListModel.fromJson(response);
      update();
      if (staffListModel.success == true) {
        loadingPage = false;
        update();
        staffData = staffListModel.data;
        update();
      }

      update();
    } else {
      loadingPage = false;
      update();
      return Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  @override
  void onInit() {
    getStaffList();
    super.onInit();
  }
}
