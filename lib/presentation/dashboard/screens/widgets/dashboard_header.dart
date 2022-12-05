import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:nellikka/dto/api_status.dart';
import 'package:nellikka/dto/sliderListDto/controllers.dart';
import 'package:nellikka/presentation/receipt/screens/receipt_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';

import 'package:nellikka/dto/userProfileDto/controllers.dart';
import 'package:nellikka/dto/userProfileDto/model.dart';
import 'package:nellikka/presentation/StringValues.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/invoice/screens/invoice_list.dart';
import 'package:nellikka/presentation/statement/screens/statement.dart';
import 'package:nellikka/presentation/visit_log/screens/visit_log.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({super.key});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
        init: UserProfileController(),
        builder: (controller) {
          List<WardDatum>? wdata;

          wdata = controller.profile.result?.wardData?.toList();

          UserInformation.write('ward_names', wdata?[0].wardName);
          return controller.isLoading
              ? const Center(
                  child: Center(
                    child: SpinKitFadingCircle(color: custom_green),
                  ),
                )
              : controller.profile.success == null
                  ? const Center(
                      child: Center(
                        child:  CupertinoActivityIndicator(
                      radius: 20.0, color: CupertinoColors.activeBlue),
                      ),
                    )
                  : Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: -45,
                            right: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/5.5,
                              margin:
                                  const EdgeInsets.only(right: 15, left: 20),
                              clipBehavior: Clip.none,
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                               // borderOnForeground: true,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            StringValues.myBalance.tr,
                                            style: GoogleFonts.overpass(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFF59597C)),
                                          ),
                                          const Spacer(),
                                         // if (controller.profile != null)
                                            controller.profile.result!
                                                        .custWallet == 'NaN' &&  controller.profile.result!
                                                        .custWallet == 'null' &&  controller.profile.result!
                                                        .custWallet == '' && controller.profile.result!
                                                        .custWallet!.isEmpty ? Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(
                                                '₹ 0',
                                                style: GoogleFonts.overpass(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xFF59597C)),
                                              ),
                                            ): Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(
                                                '₹${controller.profile.result!
                                                        .custWallet}',
                                                style: GoogleFonts.overpass(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xFF59597C)),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                    // const Divider(
                                    //   thickness: 1,
                                    //   color: Color(0xFFCADAE7),
                                    // ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                       const InvoiceListScreen()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFF4ABEFF),
                                              ),
                                              child: Image.asset(
                                                "assets/images/invoice1.png",
                                                width: 25,
                                                height: 25,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                           Text(
                                              "Invoice",
                                              style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                          GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                               CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ReceiptListScreen()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFFFFC806),
                                              ),
                                              child: Image.asset(
                                                "assets/images/receiptside.png",
                                                width: 25,
                                                height: 25,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                             Text(
                                              "Receipt",
                                              style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                               CupertinoPageRoute(
                                                  builder: (context) =>
                                                       StatementScreen()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFFFF7550),
                                              ),
                                              child: Image.asset(
                                                "assets/images/statement1.png",
                                                width: 25,
                                                height: 25,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                             Text(
                                              "Statement",
                                              style: GoogleFonts.mulish(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                               CupertinoPageRoute(
                                                  builder: (context) =>
                                                       VisitLogScreen()));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right:5.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: const Color(0xFF64CCC5),
                                                ),
                                                child: Image.asset(
                                                  "assets/images/visitor.png",
                                                  width: 25,
                                                  height: 25,
                                                  color: const Color(0xFFFFFFFF),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                               Text(
                                                "Visit",
                                                style: GoogleFonts.mulish(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                       ],
                                        ),                                                                                  ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                              width: MediaQuery.of(context).size.width,
                                child: Row(
                                   //mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Padding(
                                      padding: const EdgeInsets.only(left:25.0),
                                      child: Text(
                                        "Hello,",
                                        style: GoogleFonts.mulish(                                         
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        controller.profile.result!.custName
                                            .toString()
                                            .capitalizeFirst!
                                            .toUpperCase(),
                                        style: GoogleFonts.mulish(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 3,),
                              SizedBox(
                                width: 300,
                                height: 16,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:25.0),
                                        child: Text(
                                          controller.profile.result!.custRegNo
                                              .toString(),
                                          style: GoogleFonts.mulish(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFA0F1A9)),
                                        ),
                                      ),
                                      const Text(
                                        ",",
                                        style: TextStyle(
                                          fontSize: 15,
                                          //color: Colors.white,
                                          color: Color(0xFFA0F1A9),
                                          //fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        wdata![0].wardName.toString(),
                                        style: GoogleFonts.mulish(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFA0F1A9)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height:5),
                              GetBuilder<SlideListController>(
                                  init: SlideListController(),
                                  builder: (slideController) {
                                    return slideController.isLoading
                                        ? const Center(
                                          child: SpinKitFadingCircle(
                                              color: custom_green),
                                        )
                                        : slideController.hasData == false
                                            ? const Center(
                                                child: SpinKitFadingCircle(
                                                    color: custom_green),
                                              )
                                            :Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 0),
                                      child: CarouselSlider.builder(
                                        itemBuilder: (BuildContext, int index,
                                                dynamic) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          //height: 241,
                                          child: GestureDetector(
                                            child: Container(
                                                //clipBehavior: Clip.antiAliasWithSaveLayer,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child:Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: CachedNetworkImage(
                                                          width: 330.w,
                                                          height: 152.h,
                                                          imageUrl:  "https://nodeapi$linkStatus.nellikkastore.com/uploads/slider_images/${slideController.data?[index].image}",
                                                          fit: BoxFit.cover,
                                                          filterQuality: FilterQuality.high,
                                                        ),
                                                    ),
                                                  ],
                                                ),
                                                ),
                                          ),
                                        ),
                                        itemCount: slideController.data?.length,
                                        options: CarouselOptions(
                                          enlargeCenterPage: true,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          autoPlay: true,
                                          viewportFraction: 0.8,
                                          aspectRatio: 16/6,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 3000),
                                          //height: 150,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    );
        });
  }
}
