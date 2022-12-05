// import 'package:intl/intl.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
// import 'package:nellikka/dto/complaintDto/complaint_single_list.dart';
// import 'package:nellikka/dto/complaintDto/complaint_status_controller.dart';
// import 'package:nellikka/dto/storage.dart';
// import 'package:nellikka/presentation/dashboard/common/storage.dart';

// class ComplaintStatusUpdateController extends GetxController {
//   ComplaintSingleList detail = ComplaintSingleList();
//   final ApiBaseHelper _helper = ApiBaseHelper();
//   bool loadingDetails = false;
//   Data? data;
//   List<FollowupDetail>? followupDetails;
//   bool updatingStatus = false;
//   var drVal;
//   TextEditingController comment = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   List status = [
//     "Solved",
//     "Unsolved",
//   ];

//   getFollowupDetails(String? complaintId) async {
    
//     loadingDetails = true;
//     final response = await _helper.get(
//       "https://nodeapitest.nellikkastore.com/api/customer/complaint_single_list?complaint_id=$complaintId",
//       UserInformation.read('access_token'),
//     );
//     if (response['success'] == true) {
//      // print(complaintId);
//       //update();
//       loadingDetails = false;
//      // update();
//       detail = ComplaintSingleList.fromJson(response);
//       data = detail.data;
//       followupDetails = data?.followupDetails;
//       update();
//     } else {
//       print(complaintId);
//       loadingDetails = false;
//       update();
//       return Fluttertoast.showToast(
//         msg: response["message"],
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16,
//       );
//     }
//   }
 
// }
