import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/userProfileDto/controllers.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

final userdata = GetStorage();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Profile"),
        )),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<UserProfileController>(
                init: UserProfileController(),
                builder: (controller) {
                  return controller.isLoading == true
                      ? const Center(
                          child: Center(
                            child: SpinKitFadingCircle(color: custom_green),
                          ),
                        )
                      : controller.profile.success == false
                          ? const NoData(
                              message: "No Data Found",
                            )
                          : Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      controller.profile.result!.custImage !=
                                              null || controller.profile.result!.custImage!.isEmpty
                                              ||  controller.profile.result!.custImage == ''
                                          ? CircleAvatar(
                                              radius: 40,
                                              backgroundColor:
                                                  const Color(0xFF5CD369),
                                              child: ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://nodeapitest.nellikkastore.com/uploads/customers_images/${controller.profile.result?.custImage}",
                                                  fit: BoxFit.cover,
                                                  filterQuality: FilterQuality.high,
                                                ),
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 40,
                                              backgroundColor:
                                                  const Color(0xFF5CD369),
                                              //backgroundColor: Colors.white,
                                              child: ClipOval(
                                                child: Image.asset(
                                                    'assets/images/default_user_profile.png'),
                                              )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${controller.profile.result?.custName}"
                                            .toString()
                                            .toUpperCase(),
                                        style: GoogleFonts.mulish(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF3FA54A)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      controller.profile.result?.designationName != null&& controller.profile.result?.designationName != ''? Text(
                                        "${controller.profile.result?.designationName}",
                                        style: GoogleFonts.mulish(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF626262)),
                                      ):Text(
                                        "NILL",
                                        style: GoogleFonts.mulish(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF626262)),
                                      )
                                    ],
                                  ),
                                ),
                              
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:0.0,right: 0),
                                child: Container(
                                  width: 378,
                                  height: 465,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(249, 249, 249, 1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 10),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Mobile Number",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                              const SizedBox(width:5),
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      UserInformation.read(
                                                          'mobileno'),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Serial Number",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                                  controller.profile.result
                                                        ?.custRegNo ==
                                                    ''
                                                ? Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                     'Nil',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                ))  :Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      '${controller.profile.result?.custRegNo}'
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                           
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Ward Name",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                                  Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child:controller.wardName != null&& controller.wardName != ''? Text(
                                                      controller.wardName.toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ):Text(
                                                      "Nill",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Group Name",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                                  controller.group_name ==
                                                    ''
                                                ? Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 25,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Text(
                                                          'Nil',
                                                          textAlign:
                                                              TextAlign.left,
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
                                                      ),
                                                    ))
                                                : Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 25,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Text(
                                                          controller.group_name
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.left,
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Package Name",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                           controller.packageName == null && controller.packageName == ''
                                                    
                                                ? Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 25,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Text(
                                                          'Nil',
                                                          textAlign:
                                                              TextAlign.left,
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
                                                      ),
                                                    )) :  Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      controller.packageName
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Building Number",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                           controller.profile.result
                                                        ?.custHouseNum == null
                                                    
                                                ?Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                     'Nil',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )): Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      '${controller.profile.result?.custHouseNum}'
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
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
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Due Amount",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                           controller.profile.result
                                                        ?.custHouseNum == null
                                                    
                                                ?Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                     '0',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )): Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      '₹ ${controller.profile.result?.custDue}'
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
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
                                                  height: 50,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,left:10),
                                                    child: Text(
                                                      "Address",
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )),
                                                 const SizedBox(width:5),
                                              controller.profile.result
                                                        ?.custAddress == null
                                                    
                                                ?Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      'Nil',
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                )):Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      '${controller.profile.result?.custAddress}'
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.left,
                                                      style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              71, 71, 71, 1)),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        
                                       const SizedBox(height:10),
                                      ],
                                    ),
                                  ),
                              )
                              
                              )
                              ]
                            );
                }),
          )),
        ));
  }
}
