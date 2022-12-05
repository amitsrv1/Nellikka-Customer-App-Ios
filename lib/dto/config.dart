import 'package:nellikka/dto/api_status.dart';

class UserProfileConfig {
  //POST API
  static const String userProfileAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/staff/customer_profile";
  static const String mainMenuAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/main_menu";
  static const String invoiceListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/invoice_list";
  static const String receiptListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/receipt_list";
  static const String vistLogAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/staff/visitlog";
  static const String slideListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/slider_list";
  static const String generateTokenAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/generate_token";
  static const String statementListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/staff/view_statement";
  static const String statementSingleListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/staff/single_statement";
  static const String walletLogAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/wallet_log";
  static const String wasteRequestAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/addwaste_request";
  static const String complaintAddAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/add_complaint";
   static const String complaintImageUploadAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/staff/complaintImage";

  //GET API
  static const String wasteItemAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/reports/waste_item";
  static const String wasteRequestListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/waste_request_list";
  static const String notificationListAPI =
      " https://nodeapi$linkStatus.nellikkastore.com/api/customer/notification_list ";
  static const String complaintListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/complaint_list";
  static const String complaintSingleListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/complaint_single_list";
  static const String complaintTypeListAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/complaint_type_list"; 
  static const String phonebookAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/phonebook";
  static const String singlePhonebookAPI =
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/phonebook_single?=";
  static const String addCashToWallet = "https://nodeapitest.nellikkastore.com/api/customer/add_wallet";
      //"https://nodeapi$linkStatus.nellikkastore.com/api/customer/add_wallet";
}
