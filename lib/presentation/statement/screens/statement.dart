import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/SingleUnbilledStatementDto/model.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/statementListDto/controllers.dart';
import 'package:nellikka/dto/statementListDto/model.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/presentation/statement/screens/statement_popup.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatementScreen extends StatelessWidget {
  StatementScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0x80E5E5E5),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: "Statement"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 9.h,
          ),
          child: GetBuilder<StatementController>(
            init: StatementController(),
            builder: (controller) => SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90.w,
                        height: 36.h,
                        color: const Color(0xff3FA54A),
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Date".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 130.w,
                        height: 36.h,
                        color: const Color(0xff3FA54A),
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Ref. Number".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70.w,
                        height: 36.h,
                        color: const Color(0xff3FA54A),
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Amount".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 102.w,
                        height: 36.h,
                        color: const Color(0xff3FA54A),
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Balance".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GetBuilder<StatementController>(
                      init: StatementController(),
                      builder: (controller) {
                        return controller.isLoading
                            ? const Center(
                                child: SpinKitFadingCircle(color: custom_green))
                            : controller.statementListModel.data == null
                                ? const NoData(
                                    message: "No Data Found",
                                  )
                                : Column(
                                    children: [
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: controller.statementListModel
                                            .unbilled!.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            color: const Color(0xff8A8A8A),
                                            height: 16.h,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          controller.indexing();
                                          Unbilled unbilled = controller
                                              .statementListModel
                                              .unbilled![index];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 90.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Text(
                                                  "${unbilled.date}",
                                                  maxLines: 2,
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff626262),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 130.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w),
                                                child: Text(
                                                  "${unbilled.referenceNo}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xffB80E00),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 64.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "₹ ${unbilled.vcountMonthDue}",
                                                      style: GoogleFonts.mulish(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xffB80E00),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 101.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "₹ ${unbilled.balance}",
                                                      style: GoogleFonts.mulish(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xffB80E00),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    // InkWell(
                                                    //   onTap: () async {
                                                    //     await controller
                                                    //         .apiSingleUnBilledStatement();
                                                    //     if (controller
                                                    //         .uAvailable) {
                                                    //       showDialog(
                                                    //           context: context,
                                                    //           builder:
                                                    //               (context) {
                                                    //             return buildUnBilledDialog();
                                                    //           });
                                                    //     }
                                                    //   },
                                                    //   child: Container(
                                                    //     decoration:
                                                    //         BoxDecoration(
                                                    //       shape:
                                                    //           BoxShape.circle,
                                                    //       border: Border.all(
                                                    //           color: const Color(
                                                    //               0xffD5E8FF)),
                                                    //     ),
                                                    //     height: 26.h,
                                                    //     width: 26.w,
                                                    //     child: Center(
                                                    //       child: CircleAvatar(
                                                    //         radius: 13,
                                                    //         backgroundColor:
                                                    //             Colors.white,
                                                    //         child: Image.asset(
                                                    //           "assets/images/eye-icon.png",
                                                    //           width: 16,
                                                    //           height: 16,
                                                    //           color: const Color(
                                                    //               0xFF59597C),
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    CircleAvatar(
                                                      radius: 13,
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFD5E8FF),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await controller
                                                              .apiSingleUnBilledStatement();
                                                          if (controller
                                                              .uAvailable) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return buildUnBilledDialog();
                                                                });
                                                          }
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 11,
                                                          backgroundColor:
                                                              Colors.white,
                                                           child: Image.asset(
                                                            "assets/images/eye-icon.png",
                                                            width: 14,
                                                            height: 14,
                                                            color: const Color(
                                                                0xFF59597C),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Divider(
                                        color: const Color(0xff8A8A8A),
                                        height: 16.h,
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: controller
                                            .statementListModel.data!.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            color: const Color(0xff8A8A8A),
                                            height: 16.h,
                                          );
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          Datums data;
                                          controller.indexing();
                                          data = controller
                                              .statementListModel.data![index];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 90.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Text(
                                                  "${data.date}",
                                                  maxLines: 2,
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff626262),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Container(
                                                width: 130.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w),
                                                child: Text(
                                                  "${data.referenceNo}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: data.debit == 0
                                                          ? const Color(
                                                              0xff2A8834)
                                                          : const Color(
                                                              0xffB80E00)),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Container(
                                                width: 64.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "₹ ${data.debit == 0 ? data.credit : data.debit}",
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: data.debit == 0
                                                              ? const Color(
                                                                  0xff2A8834)
                                                              : const Color(
                                                                  0xffB80E00)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  width: 101.w,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6.w),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "₹ ${data.balance}",
                                                          style: GoogleFonts
                                                              .mulish(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: data.debit ==
                                                                    0
                                                                ? const Color(
                                                                    0xff2A8834)
                                                                : const Color(
                                                                    0xffB80E00),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        // GestureDetector(
                                                        //   onTap: () async {
                                                        //     await controller
                                                        //         .apiSingleStatement(
                                                        //             data.id
                                                        //                 .toString());
                                                        //     if (controller
                                                        //         .available) {
                                                        //       if (controller
                                                        //                   .singleStatement
                                                        //                   .statement ==
                                                        //               null &&
                                                        //           controller
                                                        //                   .singleCreditnote
                                                        //                   .statement ==
                                                        //               null) {
                                                        //         showDialog(
                                                        //             context:
                                                        //                 context,
                                                        //             builder:
                                                        //                 (context) {
                                                        //               return buildSingleInvoice();
                                                        //             });
                                                        //       } else if (controller
                                                        //                   .singleStatement
                                                        //                   .statement ==
                                                        //               null &&
                                                        //           controller
                                                        //                   .singleInvoice
                                                        //                   .statement ==
                                                        //               null) {
                                                        //         //credit note
                                                        //         showDialog(
                                                        //             context:
                                                        //                 context,
                                                        //             builder:
                                                        //                 (context) {
                                                        //               return buildSingleCreditNote();
                                                        //             });
                                                        //       } else {
                                                        //         // } else if(controller.singleInvoice.statement == null && controller.singleCreditnote.statement == null ){
                                                        //         showDialog(
                                                        //             context:
                                                        //                 context,
                                                        //             builder:
                                                        //                 (context) {
                                                        //               return buildSingleStatement();
                                                        //             });
                                                        //       }
                                                        //     }
                                                        //   },
                                                        // child: Container(
                                                        //   decoration:
                                                        //       BoxDecoration(
                                                        //     shape:
                                                        //         BoxShape.circle,
                                                        //     border: Border.all(
                                                        //         color: const Color(
                                                        //             0xffD5E8FF)),
                                                        //   ),
                                                        //   height: 26.h,
                                                        //   width: 26.w,
                                                        //   child: Center(
                                                        //     child: CircleAvatar(
                                                        //       radius: 13,
                                                        //       backgroundColor:
                                                        //           Colors.white,
                                                        //       child: Image.asset(
                                                        //         "assets/images/eye-icon.png",
                                                        //         width: 16,
                                                        //         height: 16,
                                                        //         color: const Color(
                                                        //             0xFF59597C),
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        //),
                                                        CircleAvatar(
                                                          radius: 13,
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFFD5E8FF),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await controller
                                                                  .apiSingleStatement(data
                                                                      .id
                                                                      .toString());
                                                              if (controller
                                                                  .available) {
                                                                if (controller
                                                                            .singleStatement
                                                                            .statement ==
                                                                        null &&
                                                                    controller
                                                                            .singleCreditnote
                                                                            .statement ==
                                                                        null) {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return buildSingleInvoice();
                                                                      });
                                                                } else if (controller
                                                                            .singleStatement
                                                                            .statement ==
                                                                        null &&
                                                                    controller
                                                                            .singleInvoice
                                                                            .statement ==
                                                                        null) {
                                                                  //credit note
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return buildSingleCreditNote();
                                                                      });
                                                                } else {
                                                                  // } else if(controller.singleInvoice.statement == null && controller.singleCreditnote.statement == null ){
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return buildSingleStatement();
                                                                      });
                                                                }
                                                              }
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 11,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/eye-icon.png",
                                                                width: 14,
                                                                height: 14,
                                                                color: const Color(
                                                                    0xFF59597C),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        //   ),
                                                        // ],
                                                        // ),
                                                      ])),
                                            ],
                                          );
                                        },
                                      ),
                                      Divider(
                                        color: const Color(0xff8A8A8A),
                                        height: 16.h,
                                      ),
                                      controller.paginating
                                          ? Center(
                                              child: SpinKitThreeBounce(
                                                  color: custom_green,
                                                  size: 35.sp),
                                            )
                                          : const SizedBox()
                                    ],
                                  );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSingleStatement() {
    return GetBuilder<StatementController>(
      builder: (controller) => controller.singleStatement.statement == null
          ? const SizedBox()
          : Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              insetPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.singleStatement.statement!.statementType
                              .toString(),
                          style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff479E50),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Date".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                            Text(
                              ": ${controller.formatDate(controller.singleStatement.statement!.date.toString())}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 67.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Time".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ref. Number".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "amount".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Staff".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 67.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w)
                              .copyWith(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                controller.formatTime(controller
                                    .singleStatement.statement!.time
                                    .toString()),
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          padding: EdgeInsets.symmetric(horizontal: 6.w)
                              .copyWith(right: 0),
                          child: Text(
                            "${controller.singleStatement.statement!.referenceNo}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 80.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if(controller.singleStatement.data?[0] != null)Text(
                                "₹ ${controller.singleStatement.data?[0].receiptAmount}",
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          padding: EdgeInsets.symmetric(horizontal: 9.w)
                              .copyWith(right: 0),
                          child: /*Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [*/
                              Text(
                            "${controller.singleStatement.data?[0].staffInfo?[0].firstName}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff474747),
                            ),
                          ),
                          /*],
                          ),*/
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 1.sw,
                      color: const Color(0xffEBF3FA),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Balance Amount".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                          Text(
                            "₹ ${controller.singleStatement.statement?.balance}",
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      color: const Color(0xff3FA54A),
                      minWidth: 223.w,
                      height: 46.h,
                      child: Text(
                        "Ok",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildSingleCreditNote() {
    return GetBuilder<StatementController>(
      builder: (controller) => controller.singleCreditnote.statement == null
          ? const SizedBox()
          : Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              insetPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.singleCreditnote.statement!.statementType
                              .toString(),
                          style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff479E50),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Date".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                            Text(
                              ": ${controller.formatDate(controller.singleCreditnote.statement!.date.toString())}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Time".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ref. Number".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 77.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Amount".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Staff".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w)
                              .copyWith(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                controller.formatTime(controller
                                    .singleCreditnote.statement!.time
                                    .toString()),
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          padding: EdgeInsets.symmetric(horizontal: 6.w)
                              .copyWith(right: 0),
                          child: Text(
                            "${controller.singleCreditnote.statement!.referenceNo}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 77.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "₹ ${controller.singleCreditnote.data![0].creditNoteCreditamt}",
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          padding: EdgeInsets.symmetric(horizontal: 9.w)
                              .copyWith(right: 0),
                          child: /*Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [*/
                              Text(
                            "${controller.singleCreditnote.data![0].staffInfo![0].firstName}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff474747),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 1.sw,
                      color: const Color(0xffEBF3FA),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Comments: ${controller.singleCreditnote.data![0].creditNoteComment}",
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 1.sw,
                      color: const Color(0xffEBF3FA),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Balance Amount".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                          Text(
                            "₹ ${controller.singleCreditnote.statement!.balance}",
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      color: const Color(0xff3FA54A),
                      minWidth: 223.w,
                      height: 46.h,
                      child: Text(
                        "Ok",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildSingleInvoice() {
    return GetBuilder<StatementController>(
      builder: (controller) => controller.singleInvoice.statement == null
          ? const SizedBox()
          : Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              insetPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.singleInvoice.statement!.statementType
                              .toString(),
                          style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff479E50),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Date".tr,
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                            Text(
                              ": ${controller.formatDate(controller.singleInvoice.statement!.date.toString())}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 67.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Time".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ref. Number".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "amount".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 36.h,
                          color: const Color(0xff5E88E5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Staff".tr,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 67.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w)
                              .copyWith(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                controller.formatTime(controller
                                    .singleInvoice.statement!.time
                                    .toString()),
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130.w,
                          padding: EdgeInsets.symmetric(horizontal: 6.w)
                              .copyWith(right: 0),
                          child: Text(
                            "${controller.singleInvoice.statement!.referenceNo}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff474747),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "₹ ${controller.singleInvoice.data![0].invoiceTotalAmt}",
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90.w,
                          padding: EdgeInsets.symmetric(horizontal: 9.w)
                              .copyWith(right: 0),
                          child: Text(
                            "${controller.singleInvoice.data![0].staffInfo![0].firstName}",
                            maxLines: 2,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff474747),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 1.sw,
                      color: const Color(0xffEBF3FA),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Balance Amount".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                          Text(
                            "₹ ${controller.singleInvoice.statement!.balance}",
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff5E88E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      color: const Color(0xff3FA54A),
                      minWidth: 223.w,
                      height: 46.h,
                      child: Text(
                        "Ok",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildUnBilledDialog() {
    return GetBuilder<StatementController>(
      builder: (controller) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 15.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.singleUnBilled.statement!.statementType
                        .toString()
                        .tr,
                    style: GoogleFonts.mulish(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff479E50),
                    ),
                  ),
                  /* Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Date".tr,
                        style: GoogleFonts.mulish(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff626262),
                        ),
                      ),
                      Text(
                        ": ${controller.singleUnBilled.statement!.date.toString()}",
                        style: GoogleFonts.mulish(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff626262),
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 85.w,
                    height: 36.h,
                    color: const Color(0xff5E88E5),
                    child: Center(
                      child: Text(
                        "Date".tr,
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130.w,
                    height: 36.h,
                    color: const Color(0xff5E88E5),
                    child: Center(
                      child: Text(
                        "Ref. Number".tr,
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 77.w,
                    height: 36.h,
                    color: const Color(0xff5E88E5),
                    child: Center(
                      child: Text(
                        "Amount".tr,
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75.w,
                    height: 36.h,
                    color: const Color(0xff5E88E5),
                    child: Center(
                      child: Text(
                        "Staff".tr,
                        style: GoogleFonts.mulish(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.singleUnBilled.data!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: const Color(0xff8A8A8A),
                    height: 16.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  controller.indexing();
                  Datum dataz = controller.singleUnBilled.data![index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 85.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.w)
                            .copyWith(right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${dataz.wasteCltDate}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff474747),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 130.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${dataz.wasteCltUniqueId}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff474747),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "₹ ${dataz.wasteCltTotalAmount}",
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff474747),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 75.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.w)
                            .copyWith(right: 0),
                        child: Text(
                          "${dataz.staffName}",
                          maxLines: 2,
                          style: GoogleFonts.mulish(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff474747),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                height: 40.h,
                width: 1.sw,
                color: const Color(0xffEBF3FA),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Balance Amount".tr,
                      style: GoogleFonts.mulish(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff5E88E5),
                      ),
                    ),
                    Text(
                      "₹ ${controller.singleUnBilled.statement!.balance}",
                      style: GoogleFonts.mulish(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff5E88E5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                color: const Color(0xff3FA54A),
                minWidth: 223.w,
                height: 46.h,
                child: Text(
                  "Ok",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
