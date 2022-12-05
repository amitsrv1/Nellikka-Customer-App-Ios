import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/phonebookDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import '../../presentation/profile/screens/profile.dart';

class PhonebookController extends GetxController {
  PhonebookController();
  bool hasData = true;
  String? id;
  PhonebookModel phonebookData = PhonebookModel();
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = true, lastPage = false, paginating = false;
  //var no = 5;
  List<Datum> data = [];
  int start = 0, limit = 20;
  RxBool showMsg = false.obs;
  var phonebookModel;

  callStaffApi(String userNo) async {
    final responses = await helper.post(
      'https://nodeapi$linkStatus.nellikkastore.com/api/customer/call_staff',
      {
        "customer_no": UserInformation.read('mobileno'),
        "user_no": userNo,
        "localbody": UserInformation.read('local_body_id')
      },
      UserInformation.read('access_token'),
    );
  }

  apiPhonebook() async {
    isLoading = true;
    update();

    final response = await helper.post(
      UserProfileConfig.phonebookAPI,
      {"customer_id": userdata.read('customerId')},
      UserInformation.read('access_token'),
    );

    phonebookModel = PhonebookModel.fromJson(response);
    if (phonebookModel.data != null) {
      data = phonebookModel.data!;
    }
    isLoading = false;
    update();
  }

  @override
  void onReady() {
    apiPhonebook();
    super.onReady();
  }
}
