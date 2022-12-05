import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/dto/walletLogDto/model/wallet_model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class WalletStatementController extends GetxController {
  WalletStatementController();
  //String? id;
  bool hasData = true;
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = true, lastPage = false, paginating = false;
  //var no = 5;
  WalletLogModel walletLogModel = WalletLogModel();
  List<WalletLog> walletLog = [];
  String? custWalletBalance;
  int start = 0, limit = 20;
  RxBool showMsg = false.obs;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  DateTime selectedDate = DateTime.now();
  apiWalletLog() async {
    isLoading = true;
    update();

    final response = await helper.post(
        UserProfileConfig.walletLogAPI,
        {
          "start": start,
          "limit": limit,
          "customer_id": userdata.read('customerId'),
          "from_date": userdata.read("from_date"),
          "to_date": userdata.read("to_date")
        },
        UserInformation.read('access_token'));

    if (response["success"] == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      walletLogModel = WalletLogModel.fromJson(response);
      walletLog = walletLogModel.walletLog!;
      update();
      custWalletBalance = walletLogModel.custWalletBalance;
      update();
      MoneysStorage.write('cust_wallet_balance', custWalletBalance);
      update();
    } else {
      isLoading = false;
      update();
      hasData = false;
      update();
    }
  }

  selectDateTo(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDateTo,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDateTo) {
      selectedDateTo = selected;
      update();
    }
  }

  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      update();
    }
  }

  @override
  void onReady() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String fromDate = formatter.format(now);
    selectedDate = new DateTime.now();
    selectedDateTo = new DateTime.now();
    userdata.write("from_date", fromDate);
    userdata.write("to_date", fromDate);

    apiWalletLog();
    super.onReady();
  }
}
