import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nellikka/presentation/login_page/screens/login_responsce_model.dart';

import 'config.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> otpLogin(String mobileNo) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"mobile": mobileNo}),
    );

    return loginResponseJson(response.body);
  }

  static resendOtp(String mobileNo) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.resendOTPAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"mobile": mobileNo}),
    );

    return loginResponseJson(response.body);
  }

  static Future<GenerateTokenModel> generateToken(
    String customer_id,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.generateTokenAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "customer_id": customer_id,
      }),
    );

    return generateTokenModelFromJson(response.body);
  }

  static Future<VerifyResponseModel> verifyOtp(
    String mobileNo,
    String token,
    String otpCode,
    String version,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.verifyOTPAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "mobile": mobileNo,
        "otp": otpCode,
        "token": token,
        "version": version
      }),
    );

    return verifyResponseJson(response.body);
  }
}
