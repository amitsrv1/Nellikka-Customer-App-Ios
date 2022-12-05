import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/generateTokenDto/controller.dart';
import 'package:nellikka/dto/nextVisitDto/model.dart';
import 'package:nellikka/dto/userProfileDto/controllers.dart';
import 'package:nellikka/dto/userProfileDto/model.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import '../../presentation/profile/screens/profile.dart';

class CustNextVisitController extends GetxController {
  // CustNextVisitController();
  bool hasData = true;
  String? id;
  StaffNextVisitModel custNextVisit = StaffNextVisitModel();
  ApiBaseHelper helper = ApiBaseHelper();
  bool isLoading = false, lastPage = false, paginating = false;
  //var no = 5;
  List<Datum>? data;
  int start = 0, limit = 20;
  RxBool showMsg = false.obs;
  //var custNextVisitModel;
  DateTime? previousMonth;
  String? previousDate;
  DateTime? nextMonth;
  String? nextDate;
  UserDetailsModel profile = UserDetailsModel();
  apiNextVisit() async {
    isLoading = true;
    update();
    final now = new DateTime.now();
    String year = DateFormat('y').format(now);
    String month = DateFormat('M').format(now);

    update();
    GenerateTokenController().generateTokenf().then((value) async {
      var responses = await helper.post(
          "https://nodeapi$linkStatus.nellikkastore.com/api/staff/customer_profile",
          {
            "customer_id": userdata.read('customerId'),
          },
          value.token);
      profile = UserDetailsModel.fromJson(responses);
      final response = await helper.post(
        'https://nodeapi$linkStatus.nellikkastore.com/nextvisit/list',
        {
          "customer_id": userdata.read('customerId'),
          "month": "$year,$month",
          "localbody_id": profile.result!.localBody?[0].id,
        },
        value.token,
      );
      print("NextVisit $response");
      //print(response['status']);
      print(formatter);
      print(month);
      custNextVisit = StaffNextVisitModel.fromJson(response);
      print(custNextVisit.status);
      if (response['status'] == 200) {
        isLoading = false;
        update();
        hasData = true;
        update();
        data = custNextVisit.data!.toList();
        update();
        if (data?[0] != null) {
          previousMonth = custNextVisit.data?[0].previousVistDate;
          update();
        }

        update();
        //print(previousMonth);
        previousDate = DateFormat("dd-MMMM-yyyy").format(previousMonth!);
        // print(previousDate);
        nextMonth = custNextVisit.data![0].nextvisit;
        nextDate = DateFormat("dd-MMMM-yyyy").format(nextMonth!);
        // print(nextDate);
        update();
      } else {
        isLoading = false;
        update();
        hasData = false;
        update();
      }
    });
  }

  @override
  void onReady() {
    //UserProfileController().updateDetails();
    //update();
    apiNextVisit();
    super.onReady();
  }

  var now = DateTime.now();
  final formatter = DateFormat("yyyy-mm");
  //String month = formatter.format(now);
  DateFormatTime(String month) {
    DateFormat tFormat = DateFormat("dd-MMMM-yyyy");
    DateTime parseTime = DateFormat("dd-MMMM-yyyy").parse(month);
    String formattedTime = tFormat.format(parseTime);
    return formattedTime;
  }
}
