import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/singlePhonebookDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import '../../presentation/profile/screens/profile.dart';

class PhonebookSingleListController extends GetxController {
  // PhonebookSingleListController();
  bool hasData = true;
  String? id;
  SinglePhonebookModel singlephonebookData = SinglePhonebookModel();
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = true, lastPage = false, paginating = false;
  //var no = 5;
  List<Datum> data = [];
  List<Ward>? wardList = [];
  int start = 0, limit = 20;

  RxBool showMsg = false.obs;
  //var phonebookModel;

  apiSinglePhonebook() async {
    isLoading = true;
    final response = await helper.post(
      UserProfileConfig.singlePhonebookAPI,
      {
        "user_id": userdata.read('phone_no_id'),
      },
      UserInformation.read('access_token'),
    );
    singlephonebookData = SinglePhonebookModel.fromJson(response);

    if (singlephonebookData.success == true) {
      isLoading = false;
      update();
      hasData = true;
      update();
      wardList = singlephonebookData.data![0].ward;

      update();
    } else {
      isLoading = false;
      update();
      hasData = false;
      update();
    }
  }

  @override
  void onReady() {
    apiSinglePhonebook();
    super.onReady();
  }
}
