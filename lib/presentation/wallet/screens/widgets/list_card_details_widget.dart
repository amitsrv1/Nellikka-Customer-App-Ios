import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/walletLogDto/controller/wallet_controller.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/dto/walletLogDto/controller/wallet_statement_controller.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';

class WalletCardListdDetails extends StatelessWidget {
  const WalletCardListdDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                color: const Color(0xFF3FA54A),
                child: Text(
                  "Wallet Statement",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              //AppBarWidget(title: "Wallet Log"),
              ),
        ),
        child: SafeArea(
            child: Column(
          children: const [
            walletDatePicker(),
            Expanded(child: WalletStatement())
          ],
        )));
  }
}

class walletDatePicker extends StatefulWidget {
  const walletDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<walletDatePicker> createState() => _walletDatePickerState();
}

class _walletDatePickerState extends State<walletDatePicker> {
  // DateTime? _selectedDateFrom;
  // DateTime? _selectedDateTo;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletStatementController>(
        init: WalletStatementController(),
        builder: (controller) {
          return Container(
              height: 260,
              color: const Color.fromARGB(255, 245, 249, 252),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("From"),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 45,
                        child: CupertinoTextFormFieldRow(
                          prefix: GestureDetector(
                            onTap: () async {
                              // final selectedDateTemp = await showDatePicker(
                              //   context: context,
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime.now()
                              //       .subtract(const Duration(days: 365)),
                              //   lastDate: DateTime.now(),
                              // );
                              // if (selectedDateTemp == null) {
                              //   return;
                              // } else {
                              //   //print(selectedDateTemp.toString());
                              //   setState(() {
                              //     _selectedDateFrom = selectedDateTemp;
                              //   });
                              // }
                              controller.selectDate(context);
                              controller.update();
                            },
                            child: const Icon(
                              CupertinoIcons.calendar,
                              color: custom_black,
                            ),
                          ),
                          placeholder: controller.selectedDate == null
                              ? 'Select Date'
                              : '${controller.selectedDate.day.toString()}-${controller.selectedDate.month.toString()}-${controller.selectedDate.year.toString()}',
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    const Text("To"),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 45,
                        child: CupertinoTextField(
                          suffix: GestureDetector(
                            onTap: () async {
                              // final selectedDateTemp = await showDatePicker(
                              //   context: context,
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime.now()
                              //       .subtract(const Duration(days: 365)),
                              //   lastDate: DateTime.now(),
                              // );
                              // if (selectedDateTemp == null) {
                              //   return;
                              // } else {
                              //   //print(selectedDateTemp.toString());
                              //   setState(() {
                              //     _selectedDateTo = selectedDateTemp;
                              //   });
                              // }
                              controller.selectDateTo(context);
                              controller.update();
                            },
                            child: const Icon(
                              CupertinoIcons.calendar,
                              color: custom_black,
                            ),
                          ),
                          placeholder: controller.selectedDateTo == null
                              ? 'Select Date'
                              : '${controller.selectedDateTo.day.toString()}-${controller.selectedDateTo.month.toString()}-${controller.selectedDateTo.year.toString()}',

                          //style: TextStyle(color: Colors.grey),

                          // border: const OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          //   borderSide: BorderSide(
                          //     color: Colors.grey,
                          //   ),
                          // )
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: CupertinoButton(
                          color: const Color(0xFF3FA54A),
                          disabledColor: const Color.fromARGB(255, 55, 97, 59),
                          borderRadius: BorderRadius.circular(5),
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xFF3FA54A),
                          //     disabledBackgroundColor:
                          //         const Color.fromARGB(255, 55, 97, 59),
                          //     shape: RoundedRectangleBorder(
                          //        )),
                          onPressed: () async {
                            userdata.write("from_date", "");
                            userdata.write("to_date", "");
                            final difference = controller.selectedDateTo
                                .difference(controller.selectedDate)
                                .inDays;
                            //print("difference: $difference");
                            if (difference <= 31 &&
                                difference.isNegative == false) {
                              controller.selectedDate.month < 10 &&
                                      controller.selectedDate.day < 10
                                  ? userdata.write("from_date",
                                      "${controller.selectedDate.year}-0${controller.selectedDate.month}-0${controller.selectedDate.day}")
                                  : controller.selectedDate.day < 10 &&
                                          controller.selectedDate.month >= 10
                                      ? userdata.write("from_date",
                                          "${controller.selectedDate.year}-${controller.selectedDate.month}-0${controller.selectedDate.day}")
                                      : controller.selectedDate.month < 10 &&
                                              controller.selectedDate.day >= 10
                                          ? userdata.write("from_date",
                                              "${controller.selectedDate.year}-0${controller.selectedDate.month}-${controller.selectedDate.day}")
                                          : userdata.write("from_date",
                                              "${controller.selectedDate.year}-${controller.selectedDate.month}-${controller.selectedDate.day}");

                              controller.selectedDateTo.day < 10 &&
                                      controller.selectedDateTo.month < 10
                                  ? userdata.write("to_date",
                                      "${controller.selectedDateTo.year}-0${controller.selectedDateTo.month}-0${controller.selectedDateTo.day}")
                                  : controller.selectedDateTo.day < 10 &&
                                          controller.selectedDateTo.month >= 10
                                      ? userdata.write("to_date",
                                          "${controller.selectedDateTo.year}-${controller.selectedDateTo.month}-0${controller.selectedDateTo.day}")
                                      : controller.selectedDateTo.month < 10 &&
                                              controller.selectedDateTo.day >=
                                                  10
                                          ? userdata.write("to_date",
                                              "${controller.selectedDateTo.year}-0${controller.selectedDateTo.month}-${controller.selectedDateTo.day}")
                                          : userdata.write("to_date",
                                              "${controller.selectedDateTo.year}-${controller.selectedDateTo.month}-${controller.selectedDateTo.day}");

                              await controller.apiWalletLog();
                            } else if (difference.isNegative == true) {
                              Fluttertoast.showToast(
                                msg: "Please select valid date range",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: custom_red,
                                textColor: background_white,
                                fontSize: 16.sp,
                              );
                            } else if (difference > 31) {
                              Fluttertoast.showToast(
                                msg: "Maximum one month report can be viewed.",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: custom_red,
                                textColor: background_white,
                                fontSize: 16.sp,
                              );
                            }
                          },
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: background_white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

class WalletStatement extends StatelessWidget {
  const WalletStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletStatementController>(
        init: WalletStatementController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: SpinKitFadingCircle(color: custom_green),
                )
              : controller.walletLogModel.walletLog == null ||
                      controller.walletLogModel.walletLog!.length == 0 ||
                      controller.walletLogModel.walletLog!.isEmpty == true
                  ? const Center(
                      child: NoData(
                        message: "No Data Found",
                      ),
                    )
                  : Visibility(
                      visible: controller.walletLogModel.walletLog!.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                  width: 160,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: custom_green)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 10),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.currency_rupee,
                                                color: Color(0xFF59597C),
                                                size: 20,
                                              ),
                                              Text(
                                                controller
                                                    .walletLogModel.totalCredit
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF59597C)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Total Credit",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF474747)),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 160,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: custom_green)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 10),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.currency_rupee,
                                                color: Color(0xFF59597C),
                                                size: 20,
                                              ),
                                              Text(
                                                controller
                                                    .walletLogModel.totalDebit
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF59597C)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Total Debit",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF474747)),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 36,
                                width: 89.w,
                                color: const Color(0xFF3FA54A),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Date",
                                    style: GoogleFonts.mulish(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 36,
                                width: 95,
                                color: const Color(0xFF3FA54A),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Type",
                                    style: GoogleFonts.mulish(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 36,
                                width: 88,
                                color: const Color(0xFF3FA54A),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Status",
                                    style: GoogleFonts.mulish(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 36,
                                width: 77,
                                color: const Color(0xFF3FA54A),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Amount",
                                    style: GoogleFonts.mulish(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: ListView.separated(
                            shrinkWrap: true,
                            addRepaintBoundaries: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 90.w,
                                    // padding:
                                    //     EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Text(
                                      "${controller.walletLogModel.walletLog![index].date}",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.mulish(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff626262),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 90.w,
                                    // padding:
                                    //     EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Text(
                                      controller.walletLogModel
                                                  .walletLog![index].wlogType
                                                  .toString() ==
                                              "0"
                                          ? "Expense"
                                          : "Income",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.mulish(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff626262),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 90.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Text(
                                      controller.walletLogModel
                                                  .walletLog![index].wlogType
                                                  .toString() ==
                                              "0"
                                          ? "Debit"
                                          : "Credit",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.mulish(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: controller
                                                    .walletLog[index].wlogType
                                                    .toString() ==
                                                "0"
                                            ? const Color(0xffED7D2B)
                                            : const Color(0xff3FA54A),
                                      ),

                                      // "${controller.walletLog[index].wlogType}",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 90.w,
                                    // padding:
                                    //     EdgeInsets.symmetric(horizontal: 6.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee,
                                          size: 15,
                                          color: Color(0xFF59597C),
                                        ),
                                        controller.walletLog[index]
                                                    .wlogAmount !=
                                                null
                                            ? Text(
                                                "${controller.walletLogModel.walletLog![index].wlogAmount}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.mulish(
                                                    color:
                                                        const Color(0xFF59597C),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            : Text(
                                                "0",
                                                style: GoogleFonts.mulish(
                                                    color:
                                                        const Color(0xFF59597C),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              );
                            },
                            itemCount:
                                controller.walletLogModel.walletLog!.length,
                            separatorBuilder: ((context, index) => Divider(
                                  color: const Color(0xff8A8A8A),
                                  height: 16.h,
                                )),
                          ))
                        ]),
                      ),
                    );
        });
  }
}
