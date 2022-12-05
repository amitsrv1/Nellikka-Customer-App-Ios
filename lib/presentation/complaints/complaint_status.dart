import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/complaintDto/complaint_followUp_controller.dart';
import 'package:nellikka/dto/complaintDto/complaint_list_model.dart';
import 'package:nellikka/dto/complaintDto/complaint_single_list.dart';
import 'package:nellikka/dto/complaintDto/complaint_status_controller.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nellikka/dto/walletLogDto/model/wallet_model.dart';

class CustomerComplaintStatus extends StatefulWidget {
  CustomerComplaintStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerComplaintStatus> createState() =>
      _CustomerComplaintStatusState();
}

class _CustomerComplaintStatusState extends State<CustomerComplaintStatus> {
  String? customerId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerComplaintStatusController>(
      init: CustomerComplaintStatusController(),
      builder: (controller) {
        return controller.gettingComplaints == true
            ? const Center(
                child: SpinKitFadingCircle(color: custom_green),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: controller.hasData == true
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.complaintData.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          Datum complaint = controller.complaintData[index];

                          return ComplaintStatusTile(
                            staffName: complaint.staffId,
                            complaintDate: complaint.complaintDate,
                            complaintTime: controller
                                .formatTime(complaint.time.toString()),
                            status: complaint.complaintActivestatus == 0
                                ? true
                                : complaint.complaintActivestatus == 1
                                    ? false
                                    : null,
                            dropdownVisible:
                                complaint.complaintActivestatus == 0
                                    ? false
                                    : true,
                            // controller.detail.data?.followupDetails != '' ?true : false,
                            category: complaint.type,
                            index: index,
                            //followupDetails: controller.followupDetails,
                            complaintId: complaint.id,
                            complaintId1: complaint.complaintId,
                            controller: controller,
                          );
                        })
                    : const NoData(message: "No Data Found"),
              );
      },
    );
  }
}

class ComplaintStatusTile extends StatefulWidget {
  ComplaintStatusTile(
      {Key? key,
      this.followupDetails,
      this.status,
      this.staffName,
      this.category,
      this.complaintDate,
      this.complaintTime,
      this.dropdownVisible,
      this.onTap,
      this.index,
      required this.controller,
      this.complaintId1,
      this.complaintId})
      : super(key: key);

  List<FollowupDetail>? followupDetails;

  String? complaintDate;
  String? complaintId;
  String? complaintId1;
  void Function()? onTap;
  String? complaintTime;
  String? staffName;
  String? category;
  CustomerComplaintStatusController controller;
  int? index;
  bool? status;
  bool? dropdownVisible;

  @override
  _ComplaintStatusTileState createState() => _ComplaintStatusTileState();
}

class _ComplaintStatusTileState extends State<ComplaintStatusTile> {
  bool isExtended = false;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    List<Datum> complaintd = widget.controller.complaintData;
    List<FollowupDetail>? detail =
        widget.controller.complaintData[widget.index!].followupDetails;

    
    return Container(
      width: 1.sw,
      color: background_white,
      padding: EdgeInsets.symmetric(horizontal: 8.w).copyWith(
        top: 14.h,
        bottom: isExtended ? 14.h : 10.h,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color(0xff5E88E5),
                  ),
                  height: 21.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "Date".tr,
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: background_white,
                          ),
                        ),
                        Text(
                          ": ${widget.complaintDate}, ",
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: background_white,
                          ),
                        ),
                        Text(
                          "Time",
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: background_white,
                          ),
                        ),
                        Text(
                          ": ${widget.complaintTime}",
                          style: GoogleFonts.mulish(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: background_white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.dropdownVisible!,
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: // widget.onTap,
                          () {
                             setState(() {
                                isExtended = !isExtended;
                              });
                          },
                      child: isExtended == true
                          ? const Image(
                              image:
                                  AssetImage("assets/images/drop_up_arrow.png"),
                              width: 20,
                              height: 20,
                              color: Color(0xFFA9A9A9))
                          : const Image(
                              image: AssetImage(
                                  "assets/images/drop_down_arrow.png"),
                              width: 20,
                              height: 20,
                              color: Color(0xFFA9A9A9))),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Staff".tr,
                          style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff626262),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "${widget.staffName}",
                          style: GoogleFonts.mulish(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff59597C),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "category".tr,
                          style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff626262),
                          ),
                        ),
                        Text(
                          ": ",
                          style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff626262),
                          ),
                        ),
                        Text(
                          "${widget.category}".tr,
                          style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff626262),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.status == true
                          ? const Color(0xffFFE6D5)
                          : widget.status != false && widget.status != true
                              ? Color.fromARGB(255, 104, 28, 15)
                              : const Color(0xffE5FFE9)),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 6.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.status == true
                            ? "Processing"
                            : (widget.status != false && widget.status != true
                                ? 'Not Solved'
                                : 'Solved'),
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: widget.status == true
                              ? const Color(0xff8A4D27)
                              : widget.status != false && widget.status != true
                                  ? Color.fromARGB(255, 240, 236, 236)
                                  : const Color(0xff337C3B),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      CircleAvatar(
                        backgroundColor: widget.status == true
                            ? const Color(0xffED7D2B)
                            : widget.status != false && widget.status != true
                                ? Color.fromARGB(255, 255, 39, 1)
                                : custom_green,
                        radius: 5.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              replacement: SizedBox.shrink(),
              visible: isExtended == true,
              child: Container(
                 width: 450.w,
                // padding: EdgeInsets.only(left: 10.0, right: 10),
                // height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                              
                    SizedBox(
                      height: 13.h,  
                    ),
                    Divider(              
                      color: const Color(0xff626262),
                      height: 0.h,
                      thickness: 0.3.sp,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text('#${widget.complaintId1}',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(171, 171, 171, 1))),
                    SizedBox(   
                      height: 16.h,
                    ),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      addRepaintBoundaries: true,
                      itemCount: detail!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // FollowupDetail? details =
                        //     flcontroller.detail.data?.followupDetails![index];
                        FollowupDetail? details = detail[index];
                        return details == null
                            ? const Center(
                                child:
                                    SpinKitFadingCircle(color: custom_green),
                              )
                            : Container(
                              child: CustomTimeline(
                                  key: Key(index.toString()),
                                  // onExpansionChanged:(isOpen) {
                                  //       if (isOpen) {
                                  //         setState(() {
                                  //           _selectedItem = index;
                                  //         })
                                  startLineColor: const Color(0xffAEC3FF),
                                  endLineColor: const Color(0xffAEC3FF),
                                  indicatorColor: const Color(0xff5E88E5),
                                  leadingText:
                                      '${details?.followupDate}, ${details?.followupTime!.replaceRange(details.followupTime!.length - 3, details.followupTime!.length, '')}',
                                  leadingTextStyle: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: const Color(0xff474747),
                                  ),
                                  endText:
                                      '${details?.folloupUser}: ${details?.followupComment}',
                                  endTextStyle: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: const Color(0xff474747),
                                  ),
                                ),
                            );
                      },
                      //                 onExpansionChanged: (isOpen) {
                      // if (isOpen) {
                      //   setState(() {
                      //     _selectedItem = index;
                      //   });
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTimeline extends StatelessWidget {
  CustomTimeline({
    Key? key,
    this.leadingText,
    this.endText,
    this.onExpansionChanged,
    // this.hasLeadingText,
    // this.hasEndText,
    this.hasStartLine = true,
    this.hasEndLine = true,
    // this.isFirstLine,
    // this.isLastLine,
    required this.startLineColor,
    required this.endLineColor,
    required this.indicatorColor,
    this.leadingTextStyle,
    this.endTextStyle,
    this.indicatorRadius = 5,
    this.lineWidth = 3,
    this.lineHeight = 20,
  }) : super(key: key);

  final String? leadingText;
  final String? endText;

  // final bool? hasLeadingText;
  // final bool? hasEndText;
  final bool? hasStartLine;
  final bool? hasEndLine;
  final bool? onExpansionChanged;
  // bool? isFirstLine = false;
  // bool? isLastLine = false;
  final Color startLineColor;
  final Color endLineColor;
  final Color indicatorColor;
  final TextStyle? leadingTextStyle;
  final TextStyle? endTextStyle;
  final double? indicatorRadius;
  final double? lineWidth;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: leadingText != null,
          child: SizedBox(
            width: 130.w,
            child: Text(
              leadingText.toString(),
              style: leadingTextStyle,
              //maxLines: 1,
              //overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Visibility(
          visible: leadingText != null,
          child: SizedBox(
            width: 9.w,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: hasStartLine == true,
              child: Container(
                height: lineHeight,
                width: lineWidth,
                color: startLineColor,
              ),
            ),
            CircleAvatar(
              backgroundColor: indicatorColor,
              radius: indicatorRadius,
            ),
            Visibility(
              visible: hasEndLine == true,
              child: Container(
                height: lineHeight,
                width: lineWidth,
                color: endLineColor,
              ),
            ),
          ],
        ),
        Visibility(
          visible: endText != null,
          child: SizedBox(
            width: 9.w,
          ),
        ),
        Visibility(
          visible: endText != null,
          child: SizedBox(
            width: 210.w,
            child: Text(
              endText.toString(),
              style: endTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
