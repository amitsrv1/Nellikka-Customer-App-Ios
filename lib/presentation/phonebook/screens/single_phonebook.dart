import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/singlePhonebookDto/controller.dart';
import 'package:nellikka/presentation/dashboard/screens/dashboard.dart';
import 'package:nellikka/presentation/phonebook/screens/phonebook.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

class SinglePhonebook extends StatelessWidget {
  final String? customerName;
  final String? phoneNumber;
  SinglePhonebook({
    super.key,
    this.customerName,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBarWidget(
              title: "$customerName",
              actionButton: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async {
                         if (await canLaunch("tel:$phoneNumber")) {
                          await launch("tel:$phoneNumber");
                        } else {
                          Get.snackbar("Error", "Could not call $phoneNumber",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red);
                        }
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/images/phonebook-call.png"),
                        size: 20,
                        color: Colors.white,
                      )),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GetBuilder<PhonebookSingleListController>(
                        init: PhonebookSingleListController(),
                        builder: (controller) {
                          return controller.isLoading == true
                              ? const Center(
                                  child:
                                      SpinKitFadingCircle(color: custom_green),
                                )
                              : controller.hasData == false
                                  ? Center(
                                      child: Text(
                                        "Something went wrong${userdata.read('phone_no_id')}",
                                        style: GoogleFonts.mulish(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff626262),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Column(children: [
                                        Center(
                                          child: SizedBox(
                                            height: 120,
                                            width: 120,
                                            child: controller
                                                            .singlephonebookData
                                                            .data?[0]
                                                            .userImage !=
                                                        null &&
                                                    controller
                                                        .singlephonebookData
                                                        .data![0]
                                                        .userImage!
                                                        .isNotEmpty && controller.singlephonebookData.data?[0].userImage != ''
                                                ? CircleAvatar(
                                                  backgroundColor: const Color(0xFFCFF1D5),
                                                  child: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "https://nodeapitest.nellikkastore.com/uploads/user_images/${controller.singlephonebookData.data?[0].userImage}",
                                                        placeholder: (context,
                                                                url) =>
                                                            const ShimmerEffect(),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                )
                                                : CircleAvatar(
                                                  backgroundColor: const Color(0xFFCFF1D5),
                                                  child: ClipOval(
                                                      child: Image.asset(
                                                      "'assets/images/default_user_profile.png'",
                                                      fit: BoxFit.contain,
                                                    )),
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        controller.singlephonebookData.data![0]
                                                    .firstName !=
                                                null
                                            ? Text(
                                                "${controller.singlephonebookData.data![0].firstName ?? ""} ${controller.singlephonebookData.data![0].lastName ?? ""}",
                                                style: GoogleFonts.mulish(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xFF3FA54A)),
                                              )
                                            : Text("Nill",
                                                style: GoogleFonts.mulish(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xFF3FA54A))),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        controller.singlephonebookData.data![0]
                                                    .post !=
                                                null
                                            ? Text(
                                                "${controller.singlephonebookData.data![0].post}",
                                                style: GoogleFonts.mulish(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF626262)),
                                              )
                                            : Text("Nill",
                                                style: GoogleFonts.mulish(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF3FA54A))),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            width: 361,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  249, 249, 249, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            padding: const EdgeInsets.only(
                                                top: 15, left: 14),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8.0,left:10),
                                                            child: Text(
                                                              "Mobile Number",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: GoogleFonts.mulish(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      71,
                                                                      71,
                                                                      71,
                                                                      1)),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 25,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: controller
                                                                          .singlephonebookData
                                                                          .data![
                                                                              0]
                                                                          .mobile !=
                                                                      null
                                                                  ? Text(
                                                                      '${controller.singlephonebookData.data![0].mobile}',
                                  
                                                                      // UserInformation.read(
                                                                      //     'mobileno'),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    )
                                                                  : Text(
                                                                      "Nill",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    ),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                   Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Divider(
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 20,
                                            color: const Color.fromRGBO(
                                                    138, 138, 138, 1)
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 25,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0,left:10),
                                                              child: Text(
                                                                "Company",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts.mulish(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        71,
                                                                        71,
                                                                        71,
                                                                        1)),
                                                              ),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 25,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: controller
                                                                          .singlephonebookData
                                                                          .data![
                                                                              0]
                                                                          .company !=
                                                                      null
                                                                  ? Text(
                                                                      '${controller.singlephonebookData.data![0].company}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    )
                                                                  : Text(
                                                                      'Nill',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    ),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                  Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Divider(
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 20,
                                            color: const Color.fromRGBO(
                                                    138, 138, 138, 1)
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 25,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0,left:10),
                                                              child: Text(
                                                                "Address",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts.mulish(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        71,
                                                                        71,
                                                                        71,
                                                                        1)),
                                                              ),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height: 25,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: controller.singlephonebookData.data![0].address != null ||
                                                                      controller
                                                                              .singlephonebookData
                                                                              .data![
                                                                                  0]
                                                                              .address !=
                                                                          "" ||
                                                                      controller
                                                                              .singlephonebookData
                                                                              .data![
                                                                                  0]
                                                                              .address !=
                                                                          "null" ||
                                                                      controller
                                                                          .singlephonebookData
                                                                          .data![
                                                                              0]
                                                                          .address!
                                                                          .isNotEmpty
                                                                  ? Text(
                                                                      '${controller.singlephonebookData.data![0].address!}',                                                                      
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    )
                                                                  : Text(
                                                                      'Nill',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: GoogleFonts.mulish(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: const Color.fromRGBO(
                                                                              71,
                                                                              71,
                                                                              71,
                                                                              1)),
                                                                    ),
                                                            ),
                                                          )),
                                                         const SizedBox(height: 20,)
                                                    ],
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    );
                        })))));
  }
}

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actionButton;

  const CustomAppBarWidget({Key? key, required this.title, this.actionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: const Color(0xFF3FA54A),
      leading: InkWell(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: ((context) => const PhoneBook())));
          Navigator.of(context).pop();
        },

        child: const Icon(
          Icons.arrow_back,
          size: 25,
        ),
        //iconSize: 25,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontSize: 18,
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: actionButton,

      //Image.asset("assets/images/phonebook-call.png",width:20,height: 20,color: Colors.white,)
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ));
  }
}
