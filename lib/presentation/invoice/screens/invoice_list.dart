import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/invoiceListDto/controller/invoice_controller.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/presentation/invoice/screens/invoice_list_popup.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvoiceListScreen extends StatefulWidget {
  const InvoiceListScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final InvoiceController invoiceController = Get.put(InvoiceController());
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Invoice"),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<InvoiceController>(
                    init: InvoiceController(),
                    builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(
                          child: SpinKitFadingCircle(color: custom_green),
                        );
                      } else if (controller.hasData == false) {
                        return const Center(
                          child: NoData(
                            message: "No Data Found",
                          ),
                        );
                      } else {
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 36,
                                width: 100,
                                color: const Color(0xFF3FA54A),
                                child: Align(
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
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Invoice Number",
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
                                child: Align(
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
                          const Expanded(child: InvoiceListView())
                        ]);
                      }
                    }))));
  }
}

class InvoiceListView extends StatelessWidget {
  const InvoiceListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
        init: InvoiceController(),
        builder: (controller) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            addRepaintBoundaries: true,
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90.w,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        "${controller.data[index].date}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.mulish(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff626262),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 130.w,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        "${controller.data[index].invoiceNo}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.mulish(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff626262),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 101.w,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ ${controller.data[index].balance}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff626262),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: const Color(0xFFD5E8FF),
                              child: InkWell(
                                onTap: () => InvoiceListPopup(
                                    context, controller, index),
                                child: CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "assets/images/eye-icon.png",
                                    width: 14,
                                    height: 14,
                                    color: const Color(0xFF59597C),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ]);
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 30,
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment:
              //           MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //             padding: const EdgeInsets.only(
              //                 right: 10.0, top: 0, bottom: 0),
              //             child: Row(
              //               children: [

              //                  Text( "${controller.data[index].date}",
              //                  style: GoogleFonts.mulish(
              //                   fontSize: 13,
              //                   fontWeight: FontWeight.w600
              //                  ),)
              //                     //: const Text("10.02.2022"),
              //               ],
              //             )),
              //         Padding(
              //             padding: const EdgeInsets.only(
              //                 right: 10.0, top: 0, bottom: 0),
              //             child: Row(
              //               children: [
              //                 Text( "${controller.data[index].invoiceNo}",
              //                 style:GoogleFonts.mulish(
              //                   fontSize: 13,
              //                   fontWeight: FontWeight.w600
              //                  ),)

              //               ],
              //             )),
              //         Row(
              //           mainAxisAlignment:
              //               MainAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(0.0),
              //               child: Row(children: [
              //                 const Icon(Icons.currency_rupee,size: 15,
              //                 ) ,
              //                      Text( "${controller.data[index].invoiceTotalAmt}",
              //                      style:GoogleFonts.mulish(
              //                   fontSize: 13,
              //                   fontWeight: FontWeight.w600
              //                  ), )
              //               ]),
              //             ),
              //             const SizedBox(
              //               width: 3,
              //             ),
              //             // Container(
              //             //   width: 27,
              //             //   height: 26,
              //             //   decoration: BoxDecoration(
              //             //     shape: BoxShape.circle,
              //             //     color: const Color(0xFFD5E8FF),
              //             //   ),
              //             //   child: Image(image: AssetImage("assets/images/eye.png")),
              //             // )
              //             CircleAvatar(
              //                           radius: 13,
              //                           backgroundColor: const Color(0xFFD5E8FF),
              //                           child: InkWell(
              //                             onTap: () =>
              //                     InvoiceListPopup(context,controller,index),
              //                 child: CircleAvatar(
              //                               radius: 11,
              //                               backgroundColor: Colors.white,
              //                               child: Image.asset(
              //                                 "assets/images/eye-icon.png",
              //                                 width: 16,
              //                                 height: 16,
              //                                 color: const Color(0xFF59597C),
              //                               ),
              //                             ),
              //               ),
              //             )
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // );
            },
            itemCount: controller.data.length,
            separatorBuilder: ((context, index) => Divider(
                  color: const Color(0xff8A8A8A),
                  height: 16.h,
                )),
            //invoiceController.invoiceDetailsList.value.length
          );
        });
  }
}
