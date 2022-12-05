import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/dto/walletLogDto/model/wallet_model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class WalletLogController extends GetxController {
  WalletLogController();
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
  

  apiWalletLog() async {
    isLoading = true;
    update();

    final response = await helper.post(
        UserProfileConfig.walletLogAPI,
        {
          "start": start,
          "limit": limit,
          "customer_id": userdata.read('customerId')
        },
        UserInformation.read('access_token'));
    print("wallet respone ${response}");

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
   print("custWalletBalance${custWalletBalance}");
  }

  @override
  void onReady() {
    apiWalletLog();
    super.onReady();
  }

  sum(){
  int totalwallet = int.parse(walletLogModel.totalCredit.toString())+int.parse(walletLogModel.totalDebit.toString());
    
  }

}
   
  

  


 