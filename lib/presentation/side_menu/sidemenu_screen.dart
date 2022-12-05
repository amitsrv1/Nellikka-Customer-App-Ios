import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/mainMenuDto/controllers.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/dto/userProfileDto/controllers.dart';
import 'package:nellikka/presentation/about_us/about_us.dart';
import 'package:nellikka/presentation/chat_box/screens/chat_box.dart';
import 'package:nellikka/presentation/complaints/complaints.dart';
import 'package:nellikka/presentation/contact_us/contact.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/invoice/screens/invoice_list.dart';
import 'package:nellikka/presentation/phonebook/screens/phonebook.dart';
import 'package:nellikka/presentation/phonebook/screens/single_phonebook.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';
import 'package:nellikka/presentation/receipt/screens/receipt_list.dart';
import 'package:nellikka/presentation/side_menu/showDialog.dart';
import 'package:nellikka/presentation/statement/screens/statement.dart';
import 'package:nellikka/presentation/visit_log/screens/visit_log.dart';
import 'package:nellikka/presentation/wallet/screens/wallet.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';
import 'package:nellikka/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    int value = 1;

    var locale1 = const Locale('en', 'US');
    var locale2 = const Locale('ml', 'ML');

    updateLanguage(Locale locale) {
      Get.updateLocale(locale);
    }

    value = LangStorage.read("val") ?? 1;
    return Drawer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 110,
          width: 340,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
              color: Color(0xFF35943F)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<UserProfileController>(
                init: UserProfileController(),
                builder: (userprofileController) {
                  return  userprofileController.isLoading
                    ? const Center(
                        child: Center(
                          child: SpinKitFadingCircle(color: custom_green),
                        ),
                      )
                    : userprofileController.profile.success == null
                        ? const Center(
                          child: SpinKitFadingCircle(color: custom_green),
                        )
                        :Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(children: [
                      // UserInformation.read('customer_image') == null ||
                      //         UserInformation.read('customer_image') == ''

                      userprofileController.profile.result?.custImage != null &&
                              userprofileController
                                  .profile.result!.custImage!.isNotEmpty
                          ? CircleAvatar(
                              backgroundColor:
                                                  const Color(0xFF5CD369),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://nodeapitest.nellikkastore.com/uploads/customers_images/${userprofileController.profile.result?.custImage}",
                                  fit: BoxFit.cover,
                                   placeholder: (context, url) =>
                                              const ShimmerEffect(),
                                  filterQuality: FilterQuality.high,
                                ),
                              ))
                          : CircleAvatar(
                             backgroundColor:
                                                  const Color(0xFF5CD369),
                              child: ClipOval(
                                  child: Image.asset(
                                      'assets/images/default_user_profile.png',fit: BoxFit.contain,))),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userprofileController
                                            .profile.result?.custName !=
                                        null &&  userprofileController
                                            .profile.result?.custName !=
                                        ''
                                    ? Text(
                                        userprofileController.profile.result!.custName
                                            .toString()
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFFFFFF)),
                                      )
                                    : Text(
                                        'loading !!!',
                                        style: GoogleFonts.mulish(
                                          fontSize: 13,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 2,
                                ),
                                SizedBox(
                                  width: 180,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        userprofileController.profile.result
                                                    ?.custRegNo ==
                                                null && userprofileController.profile.result
                                                    ?.custRegNo ==
                                                ''
                                            ? const Center(
                                                child: Center(
                                                  child: SpinKitThreeBounce(
                                                      color: custom_green),
                                                ),
                                              )
                                            : Text(
                                                userprofileController
                                                    .profile.result!.custRegNo!
                                                    .toString(),
                                                style: GoogleFonts.mulish(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFFA0F1A9))),
                                        userprofileController.wardName == null &&  userprofileController.wardName == ''
                                            ? const Center(
                                                child: Center(
                                                  child: SpinKitThreeBounce(
                                                      color: custom_green),
                                                ),
                                              )
                                            : FittedBox(
                                                child: Text(
                                                    ',' +
                                                        '\t' +
                                                        userprofileController
                                                            .wardName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    maxLines: 2,
                                                    style: GoogleFonts.mulish(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFFA0F1A9))),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]))
                    ]),
                  );
                }),
          )),
      const SizedBox(height: 5),
      Expanded(
        child: SizedBox(
          child: GetBuilder<MainMenuController>(
              init: MainMenuController(),
              builder: ((controller) {
                // print(controller.menuIdz2);
                return Visibility(
                  visible:
                      controller.menuIdz2!.contains("6325a76750f8dfbb002d7e5a"),
                  child: ListView(
                      addRepaintBoundaries: true,
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/pro.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              height: 16,
                              width: 61,
                              child: Text("Profile".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const ProfileScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5b'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/wallet.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 62,
                              height: 16,
                              child: Text("Wallet".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            trailing: Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFE9F0FF),
                              ),
                              child: Center(
                                //alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.currency_rupee,
                                        size: 15,
                                        color: Color(0xFF5E88E5),
                                      ),
                                    ),
                                    UserInformation.read('wallet_money') == null
                                        ? const Center(
                                            child: Center(
                                              child: SpinKitThreeBounce(
                                                  color: custom_green),
                                            ),
                                          )
                                        : UserInformation.read(
                                                    'wallet_money') ==
                                                'NaN'
                                            ? Text(
                                                '0',
                                                // textAlign: TextAlign.center,
                                                style: GoogleFonts.mulish(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF5E88E5)),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 1),
                                                child: Text(
                                                  UserInformation.read(
                                                      'wallet_money'),
                                                  // textAlign: TextAlign.center,
                                                  style: GoogleFonts.mulish(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF5E88E5)),
                                                ),
                                              ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const WalletScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5c'),
                          child: ListTile(
                            leading: SizedBox(
                              width: 25,
                              height: 25,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/images/updates.png",
                                      color: const Color(0xFF59597C),
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  Center(
                                    child: Image.asset(
                                      "assets/images/logo1.png",
                                      width: 12,
                                      height: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            title: Text("Notification".tr,
                                // style: GoogleFonts.mulish(
                                //     fontSize: 13,
                                //     fontWeight: FontWeight.w600,
                                //     color: const Color(0xFF474747))
                                    ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const ChatBox()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5d'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/invoice1.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 64,
                              height: 16,
                              child: Text("Invoice".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) =>
                                      const InvoiceListScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5e'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/receiptside.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 64,
                              height: 16,
                              child: Text("Receipt".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => ReceiptListScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5e'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/statement1.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 64,
                              height: 16,
                              child: Text("Statement".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => StatementScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e5f'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/visitor.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 34,
                              height: 16,
                              child: Text("Visits".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => VisitLogScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6325a76750f8dfbb002d7e60'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/request.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 50,
                              height: 16,
                              child: Text("Request".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) =>
                                       WasteRequestScreen()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('632be58e4b265c6d39e8e02d'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/phone-call.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 73,
                              height: 16,
                              child: Text("Phone Book".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: ((context) => const PhoneBook())));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6329a5c600050504615bea23'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/complaint1.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 70,
                              height: 16,
                              child: Text("Complaints".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const Complaints()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('6329a64000050504615bea24'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/language.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 62,
                              height: 18,
                              child: Text("Language".tr,
                                  // style:  GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            trailing: Wrap(
                              spacing: 2,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    updateLanguage(locale1);
                                    setState(() {
                                      value = 1;
                                      LangStorage.write("val", value);

                                      controller.apiUpdateLanguage(value);
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    color: value == 1
                                        ? const Color(0xFF5E88E5)
                                        : const Color(0xFFFFFFFF),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "EN",
                                        style: GoogleFonts.mulish(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: value == 1
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFF5E88E5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    updateLanguage(locale2);
                                    setState(() {
                                      value = 0;
                                      LangStorage.write("val", value);
                                      controller.apiUpdateLanguage(value);
                                    });
                                  },
                                  child: Container(
                                    width: 42,
                                    height: 30,
                                    color: value == 0
                                        ? const Color(0xFF5E88E5)
                                        : const Color(0xFFFFFFFF),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "ML",
                                        style: GoogleFonts.mulish(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: value == 0
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFF5E88E5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              //Navigator.pop(context);
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('632be5f14b265c6d39e8e02e'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/about.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 57,
                              height: 16,
                              child: Text("About Us".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const AboutUs()));
                            },
                          ),
                        ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('632be6934b265c6d39e8e02f'),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/contact.png",
                              width: 20,
                              height: 20,
                              color: const Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 58,
                              height: 18,
                              child: Text("Contact Us".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                  ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const Contact()));
                            },
                          ),
                        ),
                        // Visibility(
                        //   visible: controller.menuIdz2!
                        //       .contains(' 632be6934b265c6d39e8e02f'),
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //       "assets/images/contact.png",
                        //       width: 20,
                        //       height: 20,
                        //       color: const Color(0xFF59597C),
                        //     ),
                        //     title: SizedBox(
                        //       width: 68,
                        //       height: 16,
                        //       child: Text("Contact Us".tr,
                        //           style: GoogleFonts.mulish(
                        //               fontSize: 13,
                        //               fontWeight: FontWeight.w600,
                        //               color: Color(0xFF474747))),
                        //     ),
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //   ),
                        // ),
                        Visibility(
                          visible: controller.menuIdz2!
                              .contains('632be6b34b265c6d39e8e030'),
                          child: ListTile(
                            leading: const Icon(
                              Icons.exit_to_app,
                              size: 20,
                              color: Color(0xFF59597C),
                            ),
                            title: SizedBox(
                              width: 68,
                              height: 18,
                              child: Text("Log Out".tr,
                                  // style: GoogleFonts.mulish(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: const Color(0xFF474747))
                                      ),
                            ),
                            onTap: () {
                              showAlertDialog(
                                  context,
                                  'Sign Out'.tr,
                                  'Are you sure you want to  \n \t sign out ?',
                                  'Sign Out'.tr,
                                  'Cancel'.tr, () {
                                userdata.write('isLogged', false);
                                userdata.remove('customerId');

                                Get.offAllNamed(NavRoute.loginScreen);
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                );
              })),
        ),
      ),
    ]));
  }
}
