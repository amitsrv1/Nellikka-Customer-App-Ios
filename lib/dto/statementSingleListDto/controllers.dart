import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/statementSingleListDto/model.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';

class StatementSingleListController extends GetxController {
 // StatementSingleListController();
  ApiBaseHelper helper = ApiBaseHelper();

  bool isLoading = false, lastPage = false, paginating = false;
  StatementSingleList? statementModel;
  List<Datum> data = [];
  Statement? statementData;
  int start = 0, limit = 10;

  apiStatement() async {
    isLoading = true;
    update();

    final response = await helper.post(
        UserProfileConfig.statementSingleListAPI,
        {
          "statement_id": StatementListStorage.read('statement_id'),
        },
        UserInformation.read('access_token'));

   statementModel = StatementSingleList.fromJson(response);
    if (statementModel?.data != null) {
      data = statementModel!.data!;
    }
    if (statementModel?.statement != null) {
      statementData = statementModel!.statement!;
      update();
    }

    isLoading = false;
    update();
    //  }
  }

  @override
  void onReady() {
    apiStatement();
    super.onReady();
  }
}
