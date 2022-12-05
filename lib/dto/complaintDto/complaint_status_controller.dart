import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/complaintDto/complaint_list_model.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class CustomerComplaintStatusController extends GetxController {
  ComplaintListModel complaintListModel = ComplaintListModel();
  List<Datum> complaintData = [];
  final ApiBaseHelper _helper = ApiBaseHelper();
  bool gettingComplaints = false;
  bool hasData = true;
  getComplaintList() async {
    gettingComplaints = true;
    update();
    final response = await _helper.get(
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/complaint_list?customer_id=${userdata.read('customerId')}",
      UserInformation.read('access_token'),
    );
    if (response['success'] == true) {
      gettingComplaints = false;
      update();
      complaintListModel = ComplaintListModel.fromJson(response);
      update();
      if (complaintListModel.data?.isNotEmpty == true) {
        update();
        complaintData = complaintListModel.data!.toList();
        update();
      } else {
        hasData = false;
        update();
      }
    } else {
      gettingComplaints = false;
      update();
      hasData = false;
      update();
      return Fluttertoast.showToast(
        msg: "No complaints",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: custom_green,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  formatTime(String time) {
    DateFormat tFormat = DateFormat("hh.mm a");
    DateTime parseTime = DateFormat("HH:mm:ss").parse(time);
    String formattedTime = tFormat.format(parseTime);
    return formattedTime;
  }

  @override
  void onInit() {
    getComplaintList();
    update();
    super.onInit();
  }
}
