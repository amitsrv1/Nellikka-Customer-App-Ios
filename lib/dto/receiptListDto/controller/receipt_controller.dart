import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/receiptListDto/Model/receipt_model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class ReceiptController extends GetxController {
  ReceiptController();
  bool hasData = true;
  String? id;
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = true, lastPage = false, paginating = false;
  var no = 5;
  ReceiptModel receiptModel = ReceiptModel();
  List<Datum> data = [];
  int start = 0, limit = 10;
  RxBool showMsg = false.obs;
  //var receiptModel;

  apiReceipt() async {
    isLoading = true;
    update();

    final response = await helper.post(
        UserProfileConfig.receiptListAPI,
        {
          "customer_id": userdata.read('customerId'),
        },
        UserInformation.read('access_token'));

      if (response["success"] == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      receiptModel = ReceiptModel.fromJson(response);
      data = receiptModel.data!;
      update();
    } else {
      isLoading = false;
      update();
      hasData = false;
      update();
    }
  }

   @override
  void onReady() {
    apiReceipt();
    super.onReady();
  }

  receiptFormatTime(String time) {
    DateFormat tFormat = DateFormat("hh.mm a");
    DateTime parseTime = DateFormat("HH:mm:ss").parse(time);
    String formattedTime = tFormat.format(parseTime);
    return formattedTime;
  }
}


 