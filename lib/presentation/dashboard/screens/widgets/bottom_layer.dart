import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/nextVisitDto/controller.dart';
import 'package:get/get.dart';

class BottomLayer extends StatelessWidget {
  const BottomLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustNextVisitController>(
        init: CustNextVisitController(),
        builder: (controller) {
        //  final  previousMonth =
        //       controller.custNextVisit.data?[0].previousVistDate;
        //   String previousdate =generate
        //       DateFormat("dd-MMMM-yyyy").format(previousMonth!);
        //   final nextMonth = controller.custNextVisit.data![0].nextvisit;
        //   String nextdate = DateFormat("dd-MMMM-yyyy").format(nextMonth!);
          return controller.isLoading == true
              ? const Center(
                  child: SpinKitFadingCircle(color: custom_green),
                )
              : 
              Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18, bottom: 10, top: 20),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFFF9F9F9),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            //const SizedBox(width: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Visit",
                                //textAlign: TextAlign.left,
                                style: GoogleFonts.overpass(
                                  color: const Color(0xFF59597C),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 89,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Previous Visit",
                                      style: GoogleFonts.mulish(
                                        color: const Color(0xFF474747),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  ":",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF474747)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                controller.custNextVisit.data == null && controller.custNextVisit.data == '' && controller.custNextVisit.data!.isEmpty
                                    ?  Text(
                                        "No data found",
                                        //textAlign: TextAlign.center,
                                        //"October, 25 2021, Monday",
                                        style: GoogleFonts.mulish(
                                          color: const Color(0xFF474747),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    :Row(
                                        children: [
                                          Text(
                                            controller.previousDate.toString(),
                                            //"${controller.custNextVisit.data?[0].previousVistDate?.day}-${controller.custNextVisit.data?[0].previousVistDate?.month}-${controller.custNextVisit.data?[0].previousVistDate?.year}",
                                            //"October, 25 2021, Monday",
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFF474747),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(','),
                                          Text(
                                              " ${controller.custNextVisit.data?[0].previousVisitDay!}",
                                              //"October, 25 2021, Monday",
                                              style: GoogleFonts.mulish(
                                                color: const Color(0xFF474747),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      )
                                    
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 89,                                 
                                    child: Text(
                                      "Next Visit",
                                      //textAlign: TextAlign.center,
                                      style: GoogleFonts.mulish(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF474747)),
                                    ),
                                ),
                                  
                                
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  ":",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF474747)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                controller.nextDate == null  
                                    ?  Text(
                                        "No data found",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mulish(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF474747)),
                                      )
                                    :Row(
                                        children: [
                                          Text(
                                            controller.nextDate.toString(),
                                           // "${controller.custNextVisit.data?[0].nextvisit?.day}-${controller.custNextVisit.data?[0].nextvisit?.month}-${controller.custNextVisit.data?[0].nextvisit?.year}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF474747)),
                                          ),
                                          const Text(","),
                                          Text(
                                            " ${controller.custNextVisit.data![0].nextvisitDay!}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF474747)),
                                          )
                                        ],
                                      ),
                                    
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ])),
                );
        });
  }
}
