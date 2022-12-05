import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/invoiceListDto/model/invoice_model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class InvoiceController extends GetxController {
  InvoiceController();
  bool hasData = true;
  String? id;
  InvoiceModel invoiceModel = InvoiceModel();
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = true, lastPage = false, paginating = false;
  var no = 5;
  Datum? datum;
  List<Datum> data = [];
  int start = 0, limit = 10;
  RxBool showMsg = false.obs;
  //var invoiceModel;
  

  apiInvoice() async {
    isLoading = true;
    update();

    final response = await helper.post(
        UserProfileConfig.invoiceListAPI,
        {
          "customer_id": userdata.read('customerId'),
        },
        UserInformation.read('access_token'));
        
        print("customerId:${userdata.read('customerId')}");
        print("accessToken:${UserInformation.read('access_token')}");

      if (response["success"] == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      invoiceModel = InvoiceModel.fromJson(response);
      data = invoiceModel.data!;
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
    apiInvoice();
    super.onReady();
  }

  invoiceFormatTime(String time) {
    DateFormat tFormat = DateFormat("hh.mm a");
    DateTime parseTime = DateFormat("HH:mm:ss").parse(time);
    String formattedTime = tFormat.format(parseTime);
    return formattedTime;
  }
}
