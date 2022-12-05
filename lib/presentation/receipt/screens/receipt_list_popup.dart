import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:nellikka/dto/receiptListDto/controller/receipt_controller.dart';

String? timeFormat;

Future<void> ReceiptListPopup(
    BuildContext context, ReceiptController controller, int index) async {
  //final InvoiceController invoiceController = Get.put(InvoiceController());
  //final _nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return GetBuilder<ReceiptController>(
            init: ReceiptController(),
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 361,
                      height: 201,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultTextStyle(
                                  style: GoogleFonts.mulish(
                                      fontSize: 15.sp.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF479E50)),
                                  child: const Text(
                                    "Receipt",
                                  ),
                                ),
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF626262)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Date: ",
                                          style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${controller.data[index].date}",
                                          style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 5, right: 5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 70,
                                        color: const Color(0xFF5E88E5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            child: const Text(
                                              "Time",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF626262)),
                                            child: Text(controller
                                                .receiptFormatTime(controller
                                                    .data[index].receiptTime
                                                    .toString()))),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 115,
                                        color: const Color(0xFF5E88E5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            child: const Text(
                                              "Ref.Number",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: DefaultTextStyle(
                                          style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF626262)),
                                          child: Text(
                                              "${controller.data[index].receiptNo}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 68,
                                        color: const Color(0xFF5E88E5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            child: const Text(
                                              "Amount",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: DefaultTextStyle(
                                          style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF626262)),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.currency_rupee,
                                                size: 15,
                                                color: Color(0xFF626262),
                                              ),
                                              Text(
                                                "${controller.data[index].recieptAmount}",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 70,
                                        color: const Color(0xFF5E88E5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            child: const Text(
                                              "Staff",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: DefaultTextStyle(
                                          style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF626262)),
                                          child: Text(
                                              "${controller.data[index].staff}"),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 15.0, right: 15, top: 20),
                          //   child: Container(
                          //     height: 40,
                          //     width: 360,
                          //     color: const Color(0xFFEBF3FA),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           DefaultTextStyle(
                          //             style: GoogleFonts.mulish(
                          //                 fontSize: 13.sp,
                          //                 fontWeight: FontWeight.w700,
                          //                 color: const Color(0xFF5E88E5)),
                          //             child: const Text(
                          //               "Balance Amount",
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding:
                          //                 const EdgeInsets.only(right: 8.0),
                          //             child: Row(
                          //               children: [
                          //                 const Icon(
                          //                   Icons.currency_rupee,
                          //                   color: Color(0xFF5E88E5),
                          //                   size: 15,
                          //                 ),
                          //                 DefaultTextStyle(
                          //                   style: const TextStyle(
                          //                       fontSize: 13.sp,
                          //                       fontWeight: FontWeight.w700,
                          //                       color: Color(0xFF5E88E5)),
                          //                   child: Text(
                          //                       "${controller.data[index].balance}"),
                          //                 )
                          //               ],
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Ok",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            });
      });
}
