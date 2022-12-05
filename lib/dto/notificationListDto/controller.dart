import 'package:get/get.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/notificationListDto/model.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class NofificationListController extends GetxController {
  bool isLoading = true;
  List<Datum>? data;
  
  NotificationListModel notificationListModel = NotificationListModel();
  bool hasData = true;
  @override
  void onInit() {
    notificationListDetails();
    super.onInit();
  }

  final ApiBaseHelper _helper = ApiBaseHelper();
  // var jsonString;
  notificationListDetails() async {
    isLoading = true;
    hasData = true;
    final response = await _helper.get(
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/notification_list?customer_id=${userdata.read('customerId')}&ward_id=${UserInformation.read('ward_id')}&localbody_id=${UserInformation.read('local_body_id')}",
      UserInformation.read('access_token'),      
    );
   
    notificationListModel = NotificationListModel.fromJson(response);
    if (notificationListModel.success == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      data = notificationListModel.data;
      update();
    } else {
      isLoading = true;
      update();
      hasData = false;
      update();
    }

    return notificationListModel;
  }
}
