import 'package:get/get.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/mainMenuDto/model.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/mainMenuDto/model.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class MainMenuController extends GetxController {
  bool isLoading = false;
  List<MainMenuModel>? menuIdz = [];
  List<String>? menuIdz2 = [];
  late String menuIdz1;
  final ApiBaseHelper helper = ApiBaseHelper();
  MainMenuModel? menuModel;

  @override
  void onInit() async {
    fetchMenuList();
    super.onInit();
  }
  apiUpdateLanguage(int value) async {
    final response = await helper.post(
        "https://nodeapi$linkStatus.nellikkastore.com/api/customer/update_lang",
        {
          "customer_id": "$userdata.read('customerId')}",
          "language": "$value",
        },
        UserInformation.read('access_token'));
  }


  fetchMenuList() async {
    update();
    var response = await helper.post(
        UserProfileConfig.mainMenuAPI,
        {
          "customer_id": userdata.read('customerId'),
        },
        UserInformation.read('access_token'));

    var jsonModel = MainMenuModel.fromJson(response);
    //print(jsonString.walletBalance);
    //print(jsonString.success);
    UserInformation.write('wallet_money', jsonModel.walletBalance);

    var id;
    for (int i = 0; i < jsonModel.menus!.length; i++) {
      //print(jsonModel.success);

      //menuDetailsList.value = jsonModel.menus![i].id;
      MenuStorage.write('Menu_id', jsonModel.menus![i].id);
      var id = MenuStorage.read('Menu_id');
      menuIdz1 = jsonModel.menus![i].id!;
      menuIdz2!.add(menuIdz1);

      ///print(id);
      //menuString!.add(menuList.toString());
    }

    // menuList!.add(getid());
    //print("Menu_list:  ${menuString}");
    update();
    return menuModel;
  }
}
