import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nellikka/dto/api_handling/app_excetion/app_exceptions.dart';


class ApiBaseHelper {
  Future<dynamic> post(String url, Object body, String? accessToken) async {
    var responseJson;
    var link = Uri.parse(url);
    var data = jsonEncode(body);
    var head = {
      "Content-Type": "application/json",
      "x-access-token": "$accessToken"
    };
    try {
      final response = await http.post(link, headers: head, body: data);
      responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      Fluttertoast.showToast(
        msg: "No Internet connection",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url, String accessToken) async {
    var responseJson;
    var link = Uri.parse(url);
    var token = accessToken;
    var head = {"Content-Type": "application/json", "x-access-token": token};
    try {
      final response = await http.get(link, headers: head);
      responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      Fluttertoast.showToast(
        msg: "No Internet connection",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, String accessToken, Object body) async {
    var responseJson;
    var link = Uri.parse(url);
    var data = jsonEncode(body);
    var head = {
      "Content-Type": "application/json",
      "x-access-token": accessToken
    };
    try {
      final response = await http.put(link, headers: head, body: data);
      // responseJson = _returnMessage(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      Fluttertoast.showToast(
        msg: "No Internet connection",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
      throw UniversalException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    } else {
      throw UniversalException("${response.body} : ${response.statusCode}");
    }
   
  }

  dynamic _returnMessage(http.Response response) {
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 400:
        return Fluttertoast.showToast(
          msg: "${body['message']}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      case 404:
        return Fluttertoast.showToast(
          msg: "Invalid Input",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.sp,
        );
      case 502:
        return Fluttertoast.showToast(
          msg: "Server Error\nPlease Try Again After Some Time",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.sp,
        );
    }
  }
}
