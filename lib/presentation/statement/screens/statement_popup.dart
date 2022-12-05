import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/statementListDto/controllers.dart';
import 'package:get/get.dart';
import 'package:nellikka/dto/statementSingleListDto/controllers.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:intl/intl.dart';

String? datetime1;
Future<void> StatementPopUp(BuildContext context, int index, String id,
    StatementController statementController) async {
  //final _nameEditingController = TextEditingController();
  
  showDialog(
      context: context,
      builder: (ctx) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 361,
                height: 251,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: GetBuilder<StatementSingleListController>(
                    init: StatementSingleListController(),
                    builder: (controller) {
                      //String datetime1;
                      if (controller.statementData?.date != null)
                        datetime1 = DateFormat("dd-MM-yyyy")
                            .format(controller.statementData!.date!);

                      return controller.isLoading
                          ? const Center(
                              child: Center(
                                child: SpinKitFadingCircle(color: custom_green),
                              ),
                            )
                          : controller.statementModel?.success == false
                              ? const NoData(
                                  message: "No Data Found",
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF479E50)),
                                            child: const Text(
                                              "Receipt",
                                            ),
                                          ),
                                          DefaultTextStyle(
                                            style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF626262)),
                                            child: Text(
                                              datetime1!,
                                            ),
                                          ),
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
                                                  width: 67,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child:  Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color:
                                                            const Color(0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Time",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:5.0),
                                                  child: DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(0xFF626262)),
                                                    child: Text(
                                                      "${controller.statementData!.time}",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 95,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child:  Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color:
                                                            const Color(0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Ref.Number",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:5.0),
                                                  child: DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(0xFF626262)),
                                                    child: Text(
                                                      "${controller.statementData!.referenceNo}",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 75,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child:  Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color:
                                                            const Color(0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Amount",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DefaultTextStyle(
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(0xFF626262)),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.currency_rupee, size: 15,),
                                                      Text(
                                                        "${controller.statementData!.credit}",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 80,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child:  Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color:
                                                            const Color(0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Staff",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DefaultTextStyle(
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(0xFF626262)),
                                                  child: Text(
                                                    "${controller.data[0].staffInfo![0].firstName}" +
                                                        "${controller.data[0].staffInfo![0].lastName}",
                                                  ),
                                                ),
                                              ],
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, left: 20, right: 20),
                                      child: Container(
                                        height: 40,
                                        width: 340,
                                        color: const Color(0xFFEBF3FA),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                               DefaultTextStyle(
                                                style: GoogleFonts.mulish(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(0xFF5E88E5)),
                                                child: const Text(
                                                  "Balance Amount",
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.currency_rupee,
                                                    color: Color(0xFF5E88E5),
                                                    size: 15,
                                                  ),
                                                  DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            const Color(0xFF5E88E5)),
                                                    child: Text(
                                                      "${controller.statementData?.balance}",
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 46,
                                        width: 223,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFF3FA54A)),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xFF3FA54A)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "ok",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFFFFFFF)),
                                            )),
                                      ),
                                    )
                                  ],
                                );
                    })),
          ),
        );
      });
}
