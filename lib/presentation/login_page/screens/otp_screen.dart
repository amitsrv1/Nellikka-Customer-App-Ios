import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/generateTokenDto/controller.dart';
import 'package:nellikka/presentation/StringValues.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/login_page/screens/api_service.dart';
import 'package:nellikka/presentation/login_page/screens/model/login_model.dart';
import 'package:nellikka/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';

String? smsOTP;

class MyOTPScreen extends StatefulWidget {
  const MyOTPScreen({super.key});

  @override
  State<MyOTPScreen> createState() => _MyOTPScreenState();
}

bool isButtonDisabled = true;
TextEditingController otpController = TextEditingController();

class _MyOTPScreenState extends State<MyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    late var values = ModalRoute.of(context)!.settings.arguments as LoginModel;
    final userdata = GetStorage();
    return  CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                color: const Color.fromRGBO(249, 249, 249, 1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 125),
                      child: Center(
                          child: Image.asset(
                        'assets/images/otp_screen_image.png',
                        width: 261,
                        height: 202,
                        alignment: Alignment.center,
                        filterQuality: FilterQuality.high,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        StringValues.enterOTP,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(89, 89, 124, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringValues.weHaveTOeEnterOTP,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: const Color.fromRGBO(149, 159, 180, 1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '${values.mobileNo}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      const Color.fromRGBO(149, 159, 180, 1)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/login-screen");
                              otpController.clear();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Image(
                                image: AssetImage(
                                    "assets/images/edit_login_screen.png"),
                                filterQuality: FilterQuality.high,
                                width: 18,
                                height: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Text(
                        StringValues.enterOTP,
                        //textAlign: TextAlign.left,
                        style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(149, 159, 180, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: PinCodeTextField(
                        backgroundColor: transparent_color,
                        mainAxisAlignment: MainAxisAlignment.center,
                        appContext: context,
                        length: 4,
                        onChanged: (String smsCode) {
                          setState(() {
                            isButtonDisabled = false;
                          });
                        },
                        textStyle: const TextStyle(color: custom_black),
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        pastedTextStyle: TextStyle(
                          color: custom_green,
                          fontWeight: FontWeight.bold,
                        ),
                        hintStyle: const TextStyle(color: custom_black),
                        pinTheme: PinTheme(
                          fieldOuterPadding: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                            top: 8,
                          ),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(7),
                          fieldHeight: 45,
                          fieldWidth: 45,
                          activeColor: const Color(0xffD8EBFF),
                          inactiveColor: const Color(0xffD8EBFF),
                          selectedColor: const Color(0xffD8EBFF),
                          inactiveFillColor: const Color(0xffF5F9FF),
                          selectedFillColor: const Color(0xffF5F9FF),
                        ),
                        enablePinAutofill: true,
                        animationDuration: const Duration(microseconds: 200),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 55,
                  width: 360,
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.all(22),
                  child: CupertinoButton(
                    disabledColor: disabled_color,
                    color:custom_green,
                   borderRadius: BorderRadius.circular(5),
                    onPressed: isButtonDisabled
                        ? null
                        : () async {
                            // print(values.otp);

                            final fcmToken =
                                await FirebaseMessaging.instance.getToken();

                            smsOTP = otpController.text;
                            PackageInfo packageInfo =
                                await PackageInfo.fromPlatform();
                            String deviceVersion = packageInfo.version;
                            var myOtp = int.parse(smsOTP!);
                            print(values.otp);
                            // print(deviceVersion);
                            print(fcmToken);
                            print(values.otp);
                            APIService.verifyOtp(
                                    values.mobileNo!,
                                    fcmToken.toString(),
                                    smsOTP.toString(),
                                    deviceVersion)
                                .then((response) async {
                              if (myOtp == values.otp) {
                                if (response.success == true) {
                                  userdata.write('isLogged', true);
                                  userdata.write(
                                      'customerId', response.customer_id);
                                  Navigator.of(context).pushReplacementNamed(
                                      NavRoute.dashboard,
                                      arguments: response.customer_id);
                                  otpController.clear();
                                  print(response.customer_id);
                                  GenerateTokenController()
                                      .generateTokenf()
                                      .then((response) {
                                    response.token;
                                    UserInformation.write(
                                        'access_token', response.token);
                                  });
                                } else {                   
                                  Navigator.of(context).pop();
                                  errorMessage('Wrong OTP');
                                }
                              } else {
                                errorMessage('Wrong OTP');
                              }
                            });
                          },
                    child: Text(
                      StringValues.login,
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      StringValues.dontReceiveOTP,
                      style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(156, 156, 156, 1)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      APIService.resendOtp(values.mobileNo.toString())
                          .then((response) async {});
                      otpController.clear();
                    },
                    child: Text(
                      "Resend",
                      style: GoogleFonts.mulish(
                        color: const Color.fromRGBO(120, 120, 120, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

errorMessage(message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: custom_red,
      textColor: background_white,
      fontSize: 16.0);
}
