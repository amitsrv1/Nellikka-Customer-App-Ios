import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/visitLogDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class VisitLogController extends GetxController {
  VisitLogController();
  String? id;
  ApiBaseHelper helper = ApiBaseHelper();
  VisitLogModel visitLogModel = VisitLogModel();
  bool hasData = true;
  bool isLoading = true, lastPage = false, paginating = false;

  List<Datum> data = [];
  List<Wastecollect> wasteCollected = [];
  int start = 0, limit = 10;
  RxBool showMsg = false.obs;

  @override
  void onReady() {
    apiStatement();
    super.onReady();
  }

  apiStatement() async {
    isLoading = true;
    update();
    final response = await helper.post(
        UserProfileConfig.vistLogAPI,
        {
          "customer_id": userdata.read('customerId'),
        },
        UserInformation.read('access_token'));

    if (response["success"] == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      visitLogModel = VisitLogModel.fromJson(response);
      data = visitLogModel.data!;
      update();
    } else {
      isLoading = false;
      update();
      hasData = false;
      update();
    }
  }
}
