import 'package:get/get.dart';
import 'package:nellikka/dto/sliderListDto/model.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';

class SlideListController extends GetxController {
  bool isLoading = true;
  List<Datum>? data;
  bool hasData = true;
  @override
  void onInit() {
    slidelListDetails();
    super.onInit();
  }

  final ApiBaseHelper helper = ApiBaseHelper();
  var jsonString;
  slidelListDetails() async {
    isLoading = true;
    hasData = true;
    var response = await helper.post(
        UserProfileConfig.slideListAPI,
        {
          "localbody_id": UserInformation.read('local_body_id'),
        },
        UserInformation.read('access_token'));
    jsonString = SliderList.fromJson(response);
    if (jsonString.success == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      data = jsonString.data;
      update();
    } else {
      isLoading = true;
      update();
      hasData = false;
      update();
    }

    return jsonString;
  }
}
