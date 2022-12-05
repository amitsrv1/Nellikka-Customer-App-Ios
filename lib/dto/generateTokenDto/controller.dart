import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/generateTokenDto/model.dart';
import 'package:nellikka/presentation/dashboard/screens/dashboard.dart';

class GenerateTokenController extends GetxController {
  GenerateTokenController();
  static var client = http.Client();
 
  //GenerateTokenModel? gen;
  bool isLoading = false, lastPage = false, paginating = false;
  @override
  void onReady() {
    update();
    generateTokenf();
    update();
    super.onReady();
  }

  Future<GenerateTokensModel> generateTokenf() async {
    update();
    isLoading = true;
    var url = Uri.parse(
        'https://nodeapi$linkStatus.nellikkastore.com/api/customer/generate_token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "customer_id": userdata.read('customerId'),
      }),
    );
    
    update();
    isLoading = false;
    return generateTokensModelFromJson(response.body);
    update();
  }
}
