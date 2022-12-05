import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/StringValues.dart';
import 'package:nellikka/presentation/login_page/screens/api_service.dart';
import 'package:nellikka/presentation/login_page/screens/model/login_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/routes.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final phoneNumberInputController = TextEditingController();

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

bool isButtonDisabled = true;
//final _formKey = GlobalKey<FormState>();

class _LoginScreeenState extends State<LoginScreeen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    phoneNumberInputController.addListener(() {
      if (phoneNumberInputController.text.length != 10) {
        if (mounted)
          setState(() {
            isButtonDisabled = true;
          });
      } else {
        if (mounted)
          setState(() {
            isButtonDisabled = false;
          });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.486,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          color: Color.fromRGBO(249, 249, 249, 1),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/images/login_screen_logo.png",
                                  filterQuality: FilterQuality.high,
                                  width: 218,
                                  height: 190,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Center(
                                  child: Container(
                                      height: 25,
                                      width: 190.w,
                                      child: Text(
                                        StringValues.welcome,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w800,
                                            color: const Color.fromRGBO(
                                                89, 89, 124, 1)),
                                      )),
                                ),
                              ),

                              //Image.asset("assets/images/Welcome.jpg")
                            ])),
                    Container(
                      padding: const EdgeInsets.only(top: 80, left: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 38.0),
                              child: Text(
                                StringValues.mobileNUmber,
                                style: GoogleFonts.mulish(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(149, 159, 180, 1),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      //color: const Color.fromRGBO(248, 248, 248, 1),
                                      color: Color.fromARGB(255, 238, 239, 240),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                  ),
                                  child: Center(
                                    child: Form(
                                      // key: _formKey,
                                      child: Container(
                                        child: CupertinoTextFormFieldRow(
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.number,
                                          style: GoogleFonts.mulish(
                                            color: const Color.fromRGBO(
                                                89, 89, 124, 1),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 6.4,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          controller:
                                              phoneNumberInputController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                          ],
                                          // decoration: const InputDecoration(
                                          //   fillColor: Color.fromRGBO(
                                          //       248, 248, 248, 1),
                                          //   contentPadding:
                                          //       EdgeInsets.fromLTRB(8, 0, 5, 0),
                                          //   border: InputBorder.none,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 55,
                                width: 360,
                                margin: const EdgeInsets.all(22),
                                padding: const EdgeInsets.only(top: 10),
                                child: CupertinoButton(
                                  disabledColor: Color.fromARGB(255, 186, 216, 179),
                                  color: Color.fromARGB(255, 109, 207, 133),
                                   borderRadius:
                                              BorderRadius.circular(5),
                                  onPressed: isButtonDisabled
                                      ? null
                                      : () async {
                                          APIService.otpLogin(
                                                  phoneNumberInputController
                                                      .text)
                                              .then((response) async {
                                            if (response.success == true) {
                                              print(response.otp);
                                              Navigator.popAndPushNamed(
                                                  context, NavRoute.otpScreen,
                                                  arguments: LoginModel(
                                                    otp: response.otp,
                                                    mobileNo:
                                                        phoneNumberInputController
                                                            .text,
                                                  ));
                                            } else {
                                              errorMessage(response.message);
                                            }
                                            phoneNumberInputController.clear();
                                          });
                                        },
                                  child: Text(
                                    StringValues.loginWithOTP,
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}

errorMessage(message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: CupertinoColors.systemRed,
      textColor: CupertinoColors.white,
      fontSize: 16.0);
}
