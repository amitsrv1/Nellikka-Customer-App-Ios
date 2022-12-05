import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/complaintDto/complaint_add_model.dart';
import 'package:nellikka/dto/complaintDto/complaint_image_upload.dart';
import 'package:nellikka/dto/complaintDto/complaint_list_model.dart';
import 'package:nellikka/dto/complaintDto/complaint_type_model.dart';
import 'package:get/get.dart';
import 'package:nellikka/dto/api_handling/base_api/base_api_handler.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

List<String> imageNames = <String>[];

class CustomerAddComplaintController extends GetxController {
  CustomerAddComplaintController(
      {this.localbodyId, this.ward, this.customerId, this.group});

  String? localbodyId;
  String? ward;
  String? group;
  String? customerId;
  var staffId;
  var typeId;
  var formKey = GlobalKey<FormState>();
  List<CatgDatum>? catData;
  List<File>? images = [];
  ImagePicker imagePicker = ImagePicker();
  List<FileElement>? fileUpload;
  final ApiBaseHelper _helper = ApiBaseHelper();
  ComplaintTypeModel complaintCategory = ComplaintTypeModel();
  ComplaintAddModel complaintAddModel = ComplaintAddModel();
  ComplaintListModel complaintModel = ComplaintListModel();

  bool loadingPage = false;
  bool submittingComplaint = false;
  bool uploadingImageError = false;
  TextEditingController comment = TextEditingController();
  TextEditingController staffIds = TextEditingController();

  var priority = 'High';

  pickImage() async {
    try {
      if (images!.isEmpty || images!.length < 4) {
      var photos = await imagePicker.pickMultiImage(imageQuality: 50);
        if (photos == null) {
          return ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              content: Text('No image selected'),
              backgroundColor: Color.fromRGBO(21, 21, 21, 0.6),
            ),
          );
        } else if (photos.length > 4) {
          return ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              content: Text('Select only 4 images'),
              backgroundColor: Color.fromRGBO(21, 21, 21, 0.6),
            ),
          );
        } else {
          for (var element in photos) {
            images!.add(File(element.path));
          }
          update();
        }
      } else {
        return ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('List is full'),
            backgroundColor: Color.fromRGBO(21, 21, 21, 0.6),
          ),
        );
      }
    } catch (e) {}
  }

  getComplaintCategory() async {
    loadingPage = true;
    update();
    final response = await _helper.get(
      "https://nodeapi$linkStatus.nellikkastore.com/api/customer/complaint_type_list",
      UserInformation.read('access_token'),
    );
    if (response["success"] == true) {
      loadingPage = false;
      update();
      complaintCategory = ComplaintTypeModel.fromJson(response);
      catData = complaintCategory.data;
      update();
    } else {
      loadingPage = false;
      update();
      return Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  Future<ComplaintImageUpload> uploadImages({List<File>? file}) async {
    ComplaintImageUpload complaintImages = ComplaintImageUpload();
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://nodeapi$linkStatus.nellikkastore.com/staff_complaint/complaintImage"));
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        "x-access-token": UserInformation.read('access_token'),
      };
      List<http.MultipartFile> newList = <http.MultipartFile>[];
      for (var element in file!) {
        File imageFile = element;
        var basename = imageFile.path.split('/').last.split('.')[1];
        var multipartFiles = await http.MultipartFile.fromPath(
          'complaint_image',
          imageFile.path,
          contentType: MediaType('image', basename),
        );
        newList.add(multipartFiles);
      }
      request.headers.addAll(headers);
      request.files.addAll(newList);
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      if (res.statusCode == 200) {
        var body = await jsonDecode(res.body);
        if (body["status"] == 'success') {
          complaintImages = ComplaintImageUpload.fromJson(body);

          fileUpload = complaintImages.file;

          return complaintImages;
        } else {
          Fluttertoast.showToast(
            msg: body['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      } else {
        uploadingImageError = true;
        update();
        Fluttertoast.showToast(
          msg: "${res.statusCode} returned by server",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    } catch (e) {}
    return complaintImages;
  }

  addComplaint() async {
    submittingComplaint = true;
    update();
   
      var imageUpload = await uploadImages(file: images);

      complaintAddModel.data?.image = [];
      if (imageUpload.status == 'success') {
        imageUpload.file?.forEach((element) {
          complaintAddModel.data?.image?.add(element.filename!);

          imageNames.add(element.filename.toString());
          // imageNames = element.filename.toString() as List<String>;

          ComplaintAddStorage.write('complaint_image', element.filename);
          update();
        });
        complaintAddModel.data?.complaintType = typeId;
        complaintAddModel.data?.complaintLocalbody =
            UserInformation.read('local_body_id');
        complaintAddModel.data?.complaintGroup =
            UserInformation.read('group_id');
        complaintAddModel.data?.complaintWard = UserInformation.read('ward_id');
        complaintAddModel.data?.customerId = userdata.read('customerId');
        complaintAddModel.data?.comment = comment.text;
        complaintAddModel.data?.staffId = staffId;
        complaintAddModel.toJson();
        print(UserInformation.read('access_token'));
        print( userdata.read('customerId'));
        final response = await _helper.post(
          "https://nodeapi$linkStatus.nellikkastore.com/api/customer/add_complaint",
          {
            "complaint_type": typeId,
            "comment": comment.text,
            "staff_id": staffId,
            "image": imageNames,
            "complaint_localbody": UserInformation.read('local_body_id'),
            "complaint_ward": UserInformation.read('ward_id'),
            "complaint_group": UserInformation.read('group_id'),
            "customer_id": userdata.read('customerId'),
          },
          // complaintAddModel.toJson(),
          UserInformation.read('access_token'),
        );
        if (response['success'] == true) {
          submittingComplaint = false;

          update();
          complaintAddModel = ComplaintAddModel.fromJson(response);
          //
          reset();
          update();

          //
          // ComplaintAddStorage.write("complaint_id", complaintAddModel.data?.id);
          return Fluttertoast.showToast(
            msg: "Complaint submitted successfully".tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: custom_green,
            textColor: Colors.white,
            fontSize: 16,
          );
        } else {
          submittingComplaint = false;
          update();
          return Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      } else {
        submittingComplaint = false;
        update();
        return Fluttertoast.showToast(
          msg: imageUpload.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    
  }

  @override
  void onInit() {
    getComplaintCategory();

    super.onInit();
  }

  reset() {
    images!.clear();

    ///complaintCategory.data!.clear();
    comment.clear();
  }
}
