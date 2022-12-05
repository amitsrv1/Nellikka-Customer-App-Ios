import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/wasteRequestStatusDto/controller.dart';
import 'package:nellikka/dto/wasteRequestStatusDto/model.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/presentation/waste_request/request_popup.dart';
import '../../../custom_colors.dart';

List<WasteItemsId>? wasteItem;

class WasteStatusTab extends StatelessWidget {
  const WasteStatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WasteStatusController>(
        init: WasteStatusController(),
        builder: (controller) {
          // controller.update();
          return controller.isLoading
              ? const Center(
                  child: Center(
                    child: SpinKitFadingCircle(color: custom_green),
                  ),
                )
              : controller.wastStatusResponse.data == null ||
                      controller.wastStatusResponse.data!.isEmpty == true
                  ? const Center(
                      child: NoData(
                        message: "No Data Found",
                      ),
                    )
                  : Container(
                      // padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 115.w,
                                  height: 35.h,
                                  color: const Color(0xff3FA54A),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Item Name",
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
                                  height: 35.h,
                                  color: const Color(0xff3FA54A),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Center(
                                    child: Text(
                                      "Weight",
                                      style: GoogleFonts.mulish(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80.w,
                                  height: 35.h,
                                  color: const Color(0xff3FA54A),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Center(
                                    child: Text(
                                      "Quantity",
                                      style: GoogleFonts.mulish(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 115.w,
                                  height: 35.h,
                                  color: const Color(0xff3FA54A),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Center(
                                    child: Text(
                                      "Status",
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
                              height: 12.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: controller.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DataStatus data = controller.data[index];
                            
                                  wasteItem = controller.data[index].wasteItemsId;
                                  String datetime1 = DateFormat("dd-MM-yyyy")
                                      .format(controller.data[index].date!);
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: wasteItem?.length,
                                              addRepaintBoundaries: true,
                                              itemBuilder: (contex, indext) {
                                                return SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      '${wasteItem?[indext].wasteItemsName}',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            const Color.fromRGBO(
                                                                71, 71, 71, 1),
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      //textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          width: 40.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w),
                                          child: Text(
                                            "${data.weight}",
                                            style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 40.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w),
                                          child: Text(
                                            "${data.quantity}",
                                            style: GoogleFonts.mulish(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: SizedBox(
                                            width: 95,
                                            child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.center,
                                                children: [
                                                Container(                                                                 
                                                    width:50,
                                                  child:
                                                  data.followupStatus == 0
                                                      ? Text(
                                                          "New",
                                                          style:
                                                              GoogleFonts.mulish(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xffED7D2B),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      : Text(
                                                          "Collected",
                                                          style:
                                                              GoogleFonts.mulish(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: custom_green,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  ),
                                                  //Spacer(),
                                                  // const SizedBox(
                                                  //   width: 5,
                                                  // ),   
                                                  CircleAvatar(
                                                    radius: 9,
                                                    backgroundColor:
                                                        const Color(0xFFD5E8FF),
                                                    child: InkWell(
                                                      onTap: () => requestPopUp(
                                                          context,
                                                          index,
                                                          controller),
                                                      child: CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image.asset(
                                                          "assets/images/eye-icon.png",
                                                          width: 12,
                                                          height: 12,
                                                          color: const Color(
                                                              0xFF59597C),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Widget continueButton =
                                                            TextButton(
                                                          child: Text("Continue",
                                                              style: GoogleFonts.mulish(
                                                                  color: const Color(0xFF479E50), 
                                                                  fontSize: 15,                                                                   
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                          onPressed: () {
                                                            if (controller
                                                                    .wastStatusResponse
                                                                    .success ==
                                                                true) {
                                                              controller
                                                                  .deleteWaste(
                                                                      controller
                                                                          .data[
                                                                              index]
                                                                          .id!);
                                                              //Get.offAllNamed(NavRoute.wasteRequestScreen);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              controller
                                                                  .getWasteStatus();
                                                              controller.update();
                                                            }
                                                          },
                                                        );
                                                        Widget cancelButton =
                                                            TextButton(
                                                          child: Text("Cancel",
                                                              style: GoogleFonts.mulish(
                                                                  color: Color(
                                                                      0xff59597C),
                                                                      fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                          onPressed: () {
                                                            Navigator.of(context)
                                                                .pop();
                                                          },
                                                        );
                                                        // set up the AlertDialog
                                                        AlertDialog alert =
                                                            AlertDialog(
                                                          title: Text(
                                                              "Request Delete",
                                                              style: GoogleFonts.mulish(
                                                                  color: const Color(0xFF479E50),
                                                                  fontSize: 15,                                                                    
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                          content: Text(
                                                              "Are you sure, you want to delete the request?",
                                                              //textAlign: TextAlign.center,
                                                              style: GoogleFonts
                                                                  .mulish(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                color: const Color(
                                                                    0xff59597C),
                                                              )),
                                                          actions: [
                                                            cancelButton,
                                                            continueButton,
                                                          ],
                                                        );
                            
                                                        // show the dialog
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return alert;
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        size: 20,
                                                        color: Colors.red,
                                                      )),
                                                ]),
                                          ),
                                        )
                                      ]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
        });
  }
}
