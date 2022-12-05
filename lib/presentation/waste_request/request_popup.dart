import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/wasteRequestStatusDto/controller.dart';
import 'package:get/get.dart';
import 'package:nellikka/presentation/side_menu/showDialog.dart';
import 'package:nellikka/presentation/waste_request/waste_status_tab.dart';

import '../../routes.dart';
import '../dashboard/screens/dashboard.dart';

String? datetime1;
Future<void> requestPopUp(
    BuildContext context, int index, WasteStatusController controller) async {
  //final _nameEditingController = TextEditingController();
  datetime1 = DateFormat("dd-MM-yyyy").format(controller.data[index].date!);

  showDialog(
      context: context,
      builder: (ctx) {
        return GetBuilder<WasteStatusController>(
            init: WasteStatusController(),
            builder: (controller) {
              return controller.isLoading == true
                  ? const Center(
                      child: SpinKitFadingCircle(color: custom_green),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 355,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 15, right: 10),
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
                                            "Request",
                                          ),
                                        ),                                        
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 15, right: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 100,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Date",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xFF626262)),
                                                    child: Text(
                                                      "${datetime1}",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 105,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Weight",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xFF626262)),
                                                    child: Text(
                                                      "${controller.data[index].weight}",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 100,
                                                  color:
                                                      const Color(0xFF5E88E5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: DefaultTextStyle(
                                                      style: GoogleFonts.mulish(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: const Text(
                                                        "Quantity",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xFF626262)),
                                                    child: Text(
                                                      "${controller.data[index].quantity}",
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
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
                                                  color:
                                                      const Color(0xFF5E88E5)),
                                              child: const Text(
                                                "Status",
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                DefaultTextStyle(
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xFF5E88E5)),
                                                    child: controller
                                                                .data[index]
                                                                .followupStatus ==
                                                            0
                                                        ? const Text(
                                                            "New",
                                                          )
                                                        : const Text(
                                                            "Collected",
                                                          ))
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
                                ],
                              ),
                              Center(
                                child: Container(
                                  height: 46,
                                  width: 223,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFF3FA54A)),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF3FA54A)),
                                      onPressed: () {
                                        //Get.offAllNamed(NavRoute.wasteRequestScreen);
                                        //controller.update();
                                        Navigator.of(context).pop();
                                        //         controller.getWasteStatus();
                                      },
                                      child: Text(
                                        "Ok",
                                        style: GoogleFonts.mulish(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF)),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
            });
      });
}

showRequestDialog(BuildContext context, String alertTitle, String alertMessage,
    continueMsg, dismissMsg, VoidCallback? onPressed) {
  // set up the buttons
  int selectedIndex = 0;

  Widget continueButton = SizedBox(
    height: 40,
    width: 125,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff3FA54A),
        side: const BorderSide(
          color: Color(0xff3FA54A),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Center(
          child: Text(continueMsg,
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(color: Colors.white))),
    ),
  );
  Widget cancelButton = SizedBox(
    height: 40,
    width: 125,
    child: ElevatedButton(
        child: Text(
          dismissMsg,
          textAlign: TextAlign.center,
          style: GoogleFonts.mulish(color: Colors.green),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFFFFF),
          side: const BorderSide(
            color: Color(0xff3FA54A),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        )),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
        child: Text(alertTitle,
            style: GoogleFonts.mulish(
                color: Colors.green, fontWeight: FontWeight.w800))),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(alertMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                color: const Color(0xff8A8A8A),
              ))
        ],
      ),
    ),
    actions: [
      continueButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
