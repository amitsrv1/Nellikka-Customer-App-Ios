import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/visitLogDto/controllers.dart';
import 'package:nellikka/dto/visitLogDto/model.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitLogScreen extends StatefulWidget {
  VisitLogScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VisitLogScreen> createState() => _VisitLogScreenState();
 
}

class _VisitLogScreenState extends State<VisitLogScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: "Visit Log"),
      ),
      //backgroundColor: const Color(0x80E5E5E5),
      body: SafeArea(
        child: GetBuilder<VisitLogController>(
          init: VisitLogController(),
          builder: (controller) {
            return controller.isLoading
                    ? const Center(
                        child: Center(
                          child: SpinKitFadingCircle(color: custom_green),
                        ),
                      )
                    : controller.hasData == false
                        ? const Center(
                          child: NoData(
                              message: "No Data Found",
                            ),
                        )
                        :SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: 8.h),
                                child: ListView.separated(
                                          physics: const ScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller.data.length,
                                            separatorBuilder:
                                                (BuildContext context, int index) {
                                              return  SizedBox(
                                                height: 8.h,
                                              );
                                            },
                                            itemBuilder: (BuildContext context, int index) {
                                              return CustomExpandableTile(
                                                listLength: controller.data.length,
                                                date: controller.data[index].wasteCltDate,
                                                time: controller.data[index].wasteCltTime,
                                                totalAmount: controller
                                                    .data[index].wasteCltTotalAmount
                                                    .toString(),
                                                staffName: controller.data[index].staff,
                                                wasteStatus:
                                                    controller.data[index].wasteCltStatus,
                                                wasteCollect:
                                                    controller.data[index].wastecollect!,
                                                isDropdownVisible:
                                                    controller.data[index].wasteCltStatus ==
                                                                'No Waste' ||
                                                            controller.data[index]
                                                                    .wasteCltStatus ==
                                                                'House Closed'
                                                        ? false
                                                        : true,
                                                isTotalVisible:
                                                    controller.data[index].wasteCltStatus ==
                                                                'No Waste' ||
                                                            controller.data[index]
                                                                    .wasteCltStatus ==
                                                                'House Closed'
                                                        ? false
                                                        : true,
                                              );
                                            },
                                          ),
                              ),
                              controller.paginating
                                  ? const Center(
                                      child:
                                          SpinKitThreeBounce(color: custom_green, size: 35),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
          },
        ),
      ),
    );
  }
}

class CustomExpandableTile extends StatefulWidget {
  CustomExpandableTile({
    Key? key,
    required this.listLength,
    required this.wasteCollect,
    this.time,
    this.date,
    this.totalAmount,
    this.staffName,
    this.wasteStatus,
    required this.isDropdownVisible,
    required this.isTotalVisible,
    this.deleteStatus,
    this.onTap,
  }) : super(key: key);

  int listLength = 1;
  List<Wastecollect> wasteCollect = [];
  final String? date;
  final String? time;
  final String? totalAmount;
  final String? staffName;
  final String? wasteStatus;

  final bool isDropdownVisible;
  final bool isTotalVisible;
  final String? deleteStatus;
  final VoidCallback? onTap;

  @override
  _CustomExpandableTileState createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  bool isExpanded = false;

  totalWasteWeight() {
    num totalWeight = 0;
    for (Wastecollect waste in widget.wasteCollect) {
      if (waste.wasteCltItemNoKg!.isNotEmpty) {
        totalWeight += num.parse(waste.wasteCltItemNoKg!);
      }
    }
    return totalWeight;
  }

  totalWasteBags() {
    num totalBags = 0;
    for (Wastecollect waste in widget.wasteCollect) {
      totalBags += waste.wasteCltItemNoBag!;
    }
    return totalBags;
  }

  totalWasteAmount() {
    num totalAmount = 0;
    for (Wastecollect waste in widget.wasteCollect) {
      totalAmount += waste.wasteCltItemAmt!;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 1.sw,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(
          top: 14.h,
          bottom: isExpanded ? 18.h : 8.h,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xff3FA54A),
                    ),
                    height: 21.h,
                    //padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Padding(
                      padding: const EdgeInsets.only(left:5, right: 5),
                      child: Row(
                        children: [
                          Text(
                            "Date".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ": ${widget.date}, ",
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Time".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ": ${widget.time!.replaceRange(8 - 3, 8, '')}",
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.isTotalVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: Container(
                        height: 30.h,
                       // width: 60,
                        //padding:  EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xffF9F9F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:5,right: 5),
                          child: Center(
                            child: Text(
                              "₹ ${widget.totalAmount}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffED7D2B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: 8.h,
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
                            "Collected by".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff626262),
                            ),
                          ),
                           SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            widget.staffName.toString(),
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
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
                            "Visit Status",
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff626262),
                            ),
                          ),
                          Text(
                            ": ${widget.wasteStatus}",
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
                  Padding(
                    padding: const EdgeInsets.only(right:22.0),
                    child: SizedBox(
                      child: Row(
                        children: [
                          Visibility(
                            visible: widget.isDropdownVisible,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: isExpanded == true
                                  ? const Image(image: AssetImage("assets/images/drop_up_arrow.png"),
                                    width:20,height: 20,
                            color: Color(0xFFA9A9A9),
                          )
                                  : const  Image(image: AssetImage("assets/images/drop_down_arrow.png"),
                                         width:20,height: 20,
                            color: Color(0xFFA9A9A9),
                          ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 19,
                          // ),
                          // Visibility(
                          //   visible: widget.isDropdownVisible,
                          //   child: GestureDetector(
                          //     onTap: (){
                          //     },
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(right:10.0),
                          //       child: Container(
                          //         width: 77,
                          //         height: 35,
                          //         decoration: BoxDecoration(
                          //           border: Border.all(color:const Color(0xFFA9A9A9) ),
                          //           borderRadius: BorderRadius.circular(5)
                          //         ),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Row(
                          //             children:  [
                          //               const Image(image: AssetImage("assets/images/delete.png"),
                          //               color: Color(0xff626262),),
                          //             const SizedBox(width: 3,),
                          //             Text("Delete",
                          //             style: GoogleFonts.mulish(
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w600,
                          //             color: const Color(0xff626262),
                          //           ),)
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isExpanded == true,
                child: Column(
                  children: [
                     SizedBox(
                      height: 16.h,
                    ),
                     Divider(
                      height: 0.h,
                      thickness: 0.8.sp,
                      color: Color(0xff969696),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 125,
                            height: 35,
                            color: const Color(0xff5E88E5),
                            //padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Item",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 1,),
                         Expanded(
                          flex: 1,
                          child: Container(
                            width: 64,
                            height: 35,
                            color: const Color(0xff5E88E5),
                            padding: const EdgeInsets.symmetric(horizontal: 7)
                                .copyWith(right: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Weight",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                         const SizedBox(width: 1,),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 62,
                            height: 35,
                            color: const Color(0xff5E88E5),
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Bags",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mulish(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                         const SizedBox(width: 2,),
                         Expanded(
                          flex: 1,
                          child: Container(
                            width: 85,
                            height: 35,
                            color: const Color(0xff5E88E5),
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: widget.wasteCollect.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: Color(0xff8A8A8A),
                          height: 16,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Wastecollect waste = widget.wasteCollect[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:5.0),
                              child: SizedBox(
                                width: 90,
                                //padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: SingleChildScrollView(                                                        
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    waste.wasteCltItemName.toString(),
                                    style: GoogleFonts.mulish(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,                                                                                   
                                      color: const Color(0xff474747),
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 64,
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                "${waste.wasteCltItemNoKg}",
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 65,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                waste.wasteCltItemNoBag.toString(),
                                style: GoogleFonts.mulish(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff474747),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                width: 95,
                                padding: const EdgeInsets.only(left: 9),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "₹ ${waste.wasteCltItemAmt}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.mulish(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff474747),
                                      ),
                                    ),
                                    const SizedBox(width: 3,),                                                       
                                    Visibility(
                                      visible: waste.wasteCltItemPaidStatus == 0
                                          ? true
                                          : false,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: const Color(0xff3FA54A),
                                        ),
                                        height: 17,
                                        width: 35,                                                                                                   
                                        child: Center(                                                       
                                          child: Text(
                                            "Paid",
                                            style: GoogleFonts.mulish(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(top:6, bottom:6),
                      child: Container(
                        width: 378,
                        height: 35,
                        color: const Color(0xffEBF3FA),
                        child: Padding(
                          padding: const EdgeInsets.only(left:5.0,right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:8.0,top:10,bottom:8),
                                child: SizedBox(
                                  width: 85,
                                  height: 35,
                                  child: Text(
                                    "Total",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff59597C),
                                    ),                             
                                  ),
                                ),
                              ),
                              //const SizedBox(width: 5,),
                              SizedBox(
                                 width: 65,
                                height: 35,
                                child: Center(
                                  child: Text(  
                                    "${totalWasteWeight()} kg",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff59597C),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                 width: 65,
                                height: 35,
                                child: Center(
                                  child: Text(
                                    "${totalWasteBags()} Bags",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff59597C),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                 width: 85,
                                height: 35,
                                child: Center(
                                  child: Text(
                                    "₹ ${widget.totalAmount}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff59597C),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
