import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nellikka/dto/SingleUnbilledStatementDto/model.dart';
import 'dart:convert';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/config.dart';
import 'package:nellikka/dto/statementListDto/model.dart';
import 'package:nellikka/dto/statementSingleListDto/model.dart';
import 'package:nellikka/dto/statementSingleListDto/single_credit.dart';
import 'package:nellikka/dto/statementSingleListDto/single_invoice.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/dto/userProfileDto/service.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StatementController extends GetxController {
 

 

  String? id;
  ApiBaseHelper helper = ApiBaseHelper();

  StatementListModel statementListModel = StatementListModel();
  SingleInvoice singleInvoice = SingleInvoice();
  List<Datums> data = [];
  StatementSingleList singleStatement = StatementSingleList();
   SingleCreditNoteModel singleCreditnote = SingleCreditNoteModel();
  SingleUnbilledStatementModel singleUnBilled = SingleUnbilledStatementModel();
  bool isLoading = false, lastPage = false, paginating = false;
  var no = 5;
  ScrollController scrollController = ScrollController();
  int start = 0, limit = 10;
  RxBool showMsg = false.obs;

  apiStatement() async {
    start = 0;
    limit = 10;
    isLoading = true;
    update();
    final response = await helper.post(
        UserProfileConfig.statementListAPI,
        {"customer_id":  userdata.read('customerId')},
        UserInformation.read('access_token'));
    statementListModel= StatementListModel.fromJson(response);
    isLoading = false;
    update();
  }

  paginate() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          lastPage == false) {
        print("scroll");
        start = start + 10;
        paginating = true;
        update();
        final response = await helper.post(
            UserProfileConfig.statementListAPI,
            {"customer_id":  userdata.read('customerId')},
             UserInformation.read('access_token'));
        var newStatement = StatementListModel.fromJson(response);
        if (newStatement.data != null) {
          if (newStatement.data!.length < 10) {
            lastPage = true;
            update();
          }
          data.addAll(newStatement.data!);
          paginating = false;
          update();
        } else {
          paginating = false;
          showMsg.value = true;
          update();
        }
      } else if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        showMsg.value = true;
      } else {
        showMsg.value = false;
      }
    });
  }

  int i = 0;
  int? index;

  indexing() {
    var r = statementListModel.unbilled!.length;
    if (i != r) {
      index = i++;
    } else {
      index = index;
    }
  }

  bool available = false;
  bool uAvailable = false;

  apiSingleStatement(String statementId) async {
    singleInvoice.statement = null;
    singleStatement.statement = null;
    singleCreditnote.statement = null;
    final response = await helper.post(
        "https://nodeapi$linkStatus.nellikkastore.com/api/staff/single_statement",
        {"statement_id": statementId},
        UserInformation.read('access_token'));

    print("statement_id: ${statementId}");

    print("response_single_statement: ${response}");

    if (response["success"] == true) {
      if (response["statement"]["statement_type"] == "Receipt") {
        singleStatement = StatementSingleList.fromJson(response);

      }else  if (response["statement"]["statement_type"] == "Credit Note") {
        singleCreditnote = SingleCreditNoteModel.fromJson(response);

      }else if (response["statement"]["statement_type"] == "Deleted Receipt") {
          singleStatement = StatementSingleList.fromJson(response);

        } else {
        singleInvoice = SingleInvoice.fromJson(response);
      }
      available = true;

      update();
    } else {
      available = false;
      update();
      return Fluttertoast.showToast(
        msg: "Nothing Found",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
    }
    update();
  }

  apiSingleUnBilledStatement() async {
    final response = await helper.post(
        "https://nodeapi$linkStatus.nellikkastore.com/api/staff/single_unbilled_statement",
        {"customer_id":  userdata.read('customerId')},
        UserInformation.read('access_token'));
    if (response["success"] == true) {
      singleUnBilled = SingleUnbilledStatementModel.fromJson(response);
      uAvailable = true;
      update();
    } else {
      uAvailable = false;
      update();
      return Fluttertoast.showToast(
        msg: "Nothing Found",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
    }
    update();
  }

  formatTime(String time) {
    DateFormat tFormat = DateFormat("hh.mm a");
    DateTime parseTime = DateFormat("HH:mm:ss").parse(time);
    String formattedTime = tFormat.format(parseTime);
    return formattedTime;
  }

  formatDate(String date) {
    DateFormat dFormat = DateFormat("dd-MM-yyyy");
    DateTime parseDate = DateTime.parse(date);
    String formattedDate = dFormat.format(parseDate);
    return formattedDate;
  }

 



  @override
  void onReady() {
    apiStatement();
    paginate();
    super.onReady();
  }
}
