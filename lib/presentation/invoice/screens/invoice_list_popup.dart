import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:nellikka/custom_colors.dart';
import '../../../dto/invoiceListDto/controller/invoice_controller.dart';

String? timeFormat;

Future<void> InvoiceListPopup(
    BuildContext context, InvoiceController controller, int index) async {
  //final InvoiceController invoiceController = Get.put(InvoiceController());
  //final _nameEditingController = TextEditingController();
  showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return GetBuilder<InvoiceController>(
            init: InvoiceController(),
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 361,
                      height: 201,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: background_white),
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
                                                .invoiceFormatTime(controller
                                                    .data[index].invoiceTime
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
                                              "${controller.data[index].invoiceNo}"),
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
                                              Text(
                                                '₹',
                                                style: GoogleFonts.mulish(
                                                    color: Color(0xFF626262),
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${controller.data[index].invoiceTotalAmt}",
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
                          SizedBox(
                            height: 24.h,
                          ),
                        CupertinoButton(
                            onPressed: () {
                              Get.back();
                            },
                            color: const Color(0xff3FA54A),
                            minSize: 223.w,
                           // height: 46.h,
                            borderRadius: BorderRadius.circular(5),
                            child: Text(
                              "Ok",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: background_white,
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
