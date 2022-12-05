import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nellikka/dto/api_handling/app_excetion/app_exceptions.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/wasteRequestStatusDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:http/http.dart' as http;
import 'package:nellikka/presentation/profile/screens/profile.dart';

class WasteStatusController extends GetxController {
  final ApiBaseHelper _helper = ApiBaseHelper();

  var wasteRequestStorage = GetStorage();
  List<DataStatus> data = [];
  WasteItemsId? wasteItem;
  WasteStatusModel wastStatusResponse = WasteStatusModel();
  bool hasData = true;
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getWasteStatus();
  }

  getWasteStatus() async {
     isLoading = true;
    update();

      final response = await _helper.get(
        "https://nodeapi$linkStatus.nellikkastore.com/api/customer/waste_request_list?customer_id=${userdata.read('customerId')}",
        UserInformation.read('access_token'),
      );

      if (response["success"] == true ) {
      isLoading = false;
      update();
      hasData = true;
      update(); 
        wastStatusResponse = WasteStatusModel.fromJson(response);
        data = wastStatusResponse.data!;
        update();
      } else {
        isLoading = true;
      update();
      hasData = false;
      update();
      }
    
  }

  Future<http.Response> deleteWaste(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(
          'https://nodeapi$linkStatus.nellikkastore.com/api/customer/waste_request_delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': UserInformation.read('access_token'),
      },      
    );
    
    return response;
    
  }
}
