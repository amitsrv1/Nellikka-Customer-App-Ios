import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/walletAddCashDto/add_cash_model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';

class AddWalletController extends GetxController {
  late final _razorpay = Razorpay();
  final ApiBaseHelper helper = ApiBaseHelper();
  TextEditingController amount = TextEditingController();
  AddWalletModel addWalletModel = AddWalletModel();
  Data? adddata;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    successMessage('Payment Successful');
      print(amount);
    var responses = await helper.post(
        UserProfileConfig.addCashToWallet,
        {
           "customer_id": userdata.read('customerId'),
          "transaction_id": response.paymentId,
          "razorpay_id": 'rzp_test_lafa2GYbFb3hTq',
          "payment_response_status": "success",
          "payment_response_message": "success",
          "amount": num.parse(amount.text),
          "customer_name": UserInformation.read('username'),
          "customer_mobile": UserInformation.read(
              'mobileno'), // addWalletModel.data?.customerMobile,
          "customer_email": UserInformation.read('cust_email'),
          "currency": "INR",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
           
        },
        UserInformation.read('access_token'),
    );
    addWalletModel = AddWalletModel.fromJson(responses);
    adddata = addWalletModel.data!;
    //update();
    print(amount);
    print("addsuccess ${responses}");
    
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    errorMessage('Payment Failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL WALLET:" + response.walletName.toString(),
        timeInSecForIosWeb: 4);
  }

  successMessage(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff3FA54A),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  errorMessage(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void openGateway() async {
    var options = {
      'key': 'rzp_test_lafa2GYbFb3hTq',
      'amount': (num.parse(amount.text)*100).toString(),
      'name': UserInformation.read('username'),
      'description': 'Payment to Nellikka',
      'send_sms_hash': true,
      'prefill': {
        'customer_mobile': UserInformation.read(
            'mobileno'), // addWalletModel.data?.customerMobile,
        'customer_email': UserInformation.read('cust_email'),
      },
    };

  print("addCashOptons ${options}");
//print("name ${UserInformation.read('username')}");

    try {
      _razorpay.open(options);
    } catch (e) {}
    print("razorAmount : ${amount}");
  }
  
}
