import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/wasteRequestDto/wasteItemsmodel.dart';
import 'package:nellikka/dto/api_handling/app_excetion/app_exceptions.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/wasteRequestDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';

class WasteRequestController extends GetxController {
  final ApiBaseHelper _helper = ApiBaseHelper();
  WasteRequestItemModel categories = WasteRequestItemModel();
  bool loadingCategories = false;
  bool isLoading =true;
  bool sendingRequest = false;
  var wasteRequestStorage = GetStorage();
  TextEditingController wasteItem = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController quantity = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<bool> selectedMethod = [];
  List<String> selectedCategories = [];
  WasteRequestModel? wModel;
  WasteRequestModel wasteRequestModel = WasteRequestModel();
  getWasteItems() async {
    loadingCategories = true;
    update();
    try {
      final response = await _helper.get(
        UserProfileConfig.wasteItemAPI,
        UserInformation.read('access_token'),
      );
      categories = WasteRequestItemModel.fromJson(response);
      if (categories.status == 200) {
        loadingCategories = false;
        update();

        categories.data!.forEach((element) {
          selectedMethod.add(false);
        });
        update();
      } else {
        loadingCategories = false;
        update();
      }
    } on UniversalException {
      loadingCategories = false;
      update();
    }
  }

  wasteRequest({required List<String> wasteItemId,context}) async {
    sendingRequest = true;
    update();
    try {
      var response = await _helper.post(
        UserProfileConfig.wasteRequestAPI,
        {
          "weight": weight.text,
          "quantity": quantity.text,
          "waste_items_id": wasteItemId,
          "localbody_id": UserInformation.read('local_body_id'),
          "customer_id": userdata.read('customerId'),
          "group_id": UserInformation.read('group_id'),
          "ward_id": UserInformation.read('ward_id'),
        },
        UserInformation.read('access_token'),
      );
      wasteRequestModel = WasteRequestModel.fromJson(response);

      //wasteRequestsModel.data

      if (wasteRequestModel.success == true) {
        sendingRequest = false;
        weight.clear();
        quantity.clear();
        selectedCategories.clear();
        update();
       return Fluttertoast.showToast(
          msg: "Request submitted successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: custom_green,
          textColor: Colors.white,
          fontSize: 16,
        );
       
        
      } else {
        sendingRequest = false;
        update();
        //print(response['message']);
        return Fluttertoast.showToast(
          msg: "Error submitting request",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    } on UniversalException {
      sendingRequest = false;
      update();
    }
  }


  @override
  void onInit() {
    getWasteItems();
    // wasteRequest();
    super.onInit();
  }
}
