import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/receiptListDto/controller/receipt_controller.dart';
import 'package:nellikka/presentation/receipt/screens/receipt_list_popup.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get/get.dart';

class ReceiptListScreen extends StatefulWidget {

  ReceiptListScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptListScreen> createState() => _ReceiptListScreenState();
}

class _ReceiptListScreenState extends State<ReceiptListScreen> {
   @override
   void didChangeDependencies() {
    // TODO: implement didChangeDependencies
       
    super.didChangeDependencies();
  }
  //ReceiptController receiptController = Get.put(ReceiptController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
         middle: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Receipt"),
        ),
        ),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<ReceiptController>(
                init: ReceiptController(),
                builder: (controller) {
                  return controller.isLoading 
                    ? const Center(
                  child: SpinKitFadingCircle(color: custom_green),
                )
              : controller.hasData == false
                  ? const Center(
                    child: NoData(
                        message: "No Data Found",
                      ),
                  )
                  : 
                  Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 36,
                        width: 100,
                        color: const Color(0xFF3FA54A),
                        child:  Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Date",
                           style: GoogleFonts.mulish(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        height: 36,
                        width: 140,
                        color: const Color(0xFF3FA54A),
                        child:  Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Receipt Number",
                           style: GoogleFonts.mulish(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        height: 36,
                        width: 100,
                        color: const Color(0xFF3FA54A),
                        child:  Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Amount",
                            style: GoogleFonts.mulish(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Column(
                    children: [
                       ListView.separated(
                        shrinkWrap: true,
                        addRepaintBoundaries:true,
                    itemBuilder: (context, index) {
                      return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 90.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Text(
                                                  "${controller.data[index].date}",
                                                  textAlign: TextAlign.center,
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
                                                  "${controller.data[index].receiptNo}",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                width: 101.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "₹ ${controller.data[index].recieptAmount}",
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.mulish(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xff626262),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    
                                                    CircleAvatar(
                                                      radius: 13,
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFD5E8FF),
                                                      child: GestureDetector(
                                                         onTap: () => ReceiptListPopup(context, controller, index),
                                                        child: CircleAvatar(
                                                          radius: 11,
                                                          backgroundColor:
                                                             background_white,
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
                                                )
                                              )
                                            ]);

                      // return Padding(
                      //   padding: const EdgeInsets.only(left:5,right: 5),
                      //   child: SizedBox(
                      //     height: 35,
                      //     width: double.infinity,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Padding(
                      //             padding: const EdgeInsets.only(
                      //                 right: 10.0, top: 0, bottom: 0),
                      //             child: Row(
                      //               children: [
                      //                 Text("${controller.data[index].date}",
                      //                 textAlign: TextAlign.center,
                      //                  style: GoogleFonts.mulish(
                      //                           fontSize: 13.h,
                      //                           fontWeight: FontWeight.w600
                      //                          ),)
                                      
                      //               ],
                      //             )),
                      //         Padding(
                      //             padding: const EdgeInsets.only(
                      //                 right: 10.0, top: 0, bottom: 0),
                      //             child: Row(
                      //               children: [
                      //                 Text("${controller.data[index].receiptNo}",
                      //                  style: GoogleFonts.mulish(
                      //                           fontSize: 13,
                      //                           fontWeight: FontWeight.w600
                      //                          ),)
                                      
                      //               ],
                      //             )),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Padding(
                      //               padding: const EdgeInsets.only(left:10.0,right: 12,top: 10,bottom: 10),
                      //               child: Row(children: [
                      //                 const Icon(Icons.currency_rupee,size: 15,
                      //                         ) , 
                      //                 Text("${controller.data[index].recieptAmount}",
                      //                  style: GoogleFonts.mulish(
                      //                           fontSize: 13,
                      //                           fontWeight: FontWeight.w600
                      //                          ),)
                      //               ]),
                      //             ),
                      //             const SizedBox(
                      //               width: 5,
                      //             ),
                      //             CircleAvatar(
                      //               radius: 13,
                      //               backgroundColor: const Color(0xFFD5E8FF),
                      //               child: GestureDetector(
                      //                 onTap: () => ReceiptListPopup(context, controller, index),
                      //                 child: CircleAvatar(
                      //                   radius: 11,
                      //                   backgroundColor:background_white,
                      //                   child: Image.asset(
                      //                     "assets/images/eye-icon.png",
                      //                     width: 16,
                      //                     height: 16,
                      //                     color: const Color(0xFF59597C),
                      //                   ),
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                    },
                    itemCount:
                        controller.data.length,
                    separatorBuilder: ((context, index) => Divider(color: const Color(0xff8A8A8A),
                                            height: 16.h,)),
                  )
                    ]
                  )
                ]);
  }))));
  }
}

// class ReceiptList extends StatelessWidget {

//   final ReceiptController receiptController =
//         Get.put(ReceiptController());

//    ReceiptList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 40,
//         width: double.infinity,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
//               child:Row(children: [
//                 (receiptController.receiptDetailsList.value != null) ?
//                 Text(receiptController.receiptDetailsList.value.data![index].date.toString())
//                 : Text("10.02.2022"),
//               ],)

//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
//               child: Row(children: [
//                 (receiptController.receiptDetailsList.value != null) ?
//                 Text(receiptController.receiptDetailsList.value.data!.receiptNo.toString())
//                 : Text("#12345"),
//               ],)

//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(children: [
//                 (receiptController.receiptDetailsList.value != null) ?
//                 Text(receiptController.receiptDetailsList.value.data![0].recieptAmount.toString())
//                  : Text("100"),
//               ]),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Color(0xFFD5E8FF),
//                   child: GestureDetector(
//                     onTap: () => ReceiptListPopup(context),
//                     child: CircleAvatar(
//                       radius: 13,
//                       backgroundColor:background_white,
//                       child: Image.asset(
//                         "assets/images/eye.png",
//                         width: 20,
//                         height: 20,
//                         color: Color(0xFF59597C),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
