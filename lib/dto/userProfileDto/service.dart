import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/userProfileDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

final ApiBaseHelper helper = ApiBaseHelper();
fetchDetail() async {
  var response = await helper.post(
      UserProfileConfig.userProfileAPI,
      {
        "customer_id": userdata.read('customerId'),
      },
      UserInformation.read('access_token'));
  var jsonString = UserDetailsModel.fromJson(response);
  //print(jsonString.result!.custName);
  // print(jsonString.success);
  UserInformation.write('username', jsonString.result!.custName);
  UserInformation.write('mobileno', jsonString.result!.custPhone);
  UserInformation.write('customer_address', jsonString.result!.custAddress);
  UserInformation.write('customer_address1', jsonString.result!.custAddress1);
  UserInformation.write('customer_wallet', jsonString.result!.custWallet);
  return jsonString;
}
