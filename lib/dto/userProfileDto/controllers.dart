import 'package:get/get.dart';
import 'package:nellikka/dto/generateTokenDto/controller.dart';
import 'package:nellikka/dto/userProfileDto/model.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/userProfileDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class UserProfileController extends GetxController {
  bool isLoading = true;
  @override
  void onInit() {
    UserInformation.read('access_token');
    update();
    updateDetails();
    update();
    super.onInit();
  }

  List<LocalBody>? localBodyList = [];
  UserDetailsModel profile = UserDetailsModel();
  final ApiBaseHelper helper = ApiBaseHelper();
  var wardName;
  var group_name;
  var packageName;
  updateDetails() async {
    GenerateTokenController().generateTokenf().then((responses) async {
      responses.token;
      UserInformation.write('access_token', responses.token);

      isLoading = true;

      var response = await helper.post(
          UserProfileConfig.userProfileAPI,
          {
            "customer_id": userdata.read('customerId'),
          },
          responses.token);

      profile = UserDetailsModel.fromJson(response);
      update();
      //print(jsonString.result!.custName);
      // print(jsonString.success);
      localBodyList = profile.result!.localBody;
      var localBodId = profile.result!.localBody![0].id;
      var wardDta = profile.result?.wardData?.toList();
      wardName = wardDta![0].wardName;
      var wardId = wardDta[0].id;
      var groupdDta = profile.result?.groupData?.toList();
      var group_id = groupdDta![0].id;
      group_name = groupdDta[0].groupName;
      var packageDta = profile.result?.packageData?.toList();
      List<TblTariff>? tblTrariff = packageDta?[0].tblTariff;
       packageName = tblTrariff?[0].packageName;
      //print(localBodId);
      UserInformation.write('package_name', packageName);
      UserInformation.write('local_body_id', localBodId);
      UserInformation.write('username', profile.result!.custName);
      UserInformation.write('mobileno', profile.result!.custPhone);
      UserInformation.write('cust_email', profile.result!.custEmail);
      UserInformation.write('customer_address', profile.result!.custAddress);
      UserInformation.write('customer_address1', profile.result!.custAddress1);
      UserInformation.write('customer_reg_no', profile.result!.custRegNo);
      UserInformation.write('customer_wallet', profile.result!.custWallet);
      UserInformation.write('customer_image', profile.result!.custImage);
      UserInformation.write('ward_id', wardId);
      UserInformation.write('ward_name', wardName);
      UserInformation.write('group_id', group_id);
      UserInformation.write('group_name', group_name);
      update();
      isLoading = false;
      return profile;
    });
  }
}
