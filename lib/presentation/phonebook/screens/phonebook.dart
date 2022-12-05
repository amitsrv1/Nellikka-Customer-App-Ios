import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/phonebookDto/phonebook_controller.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/dashboard/screens/dashboard.dart';
import 'package:nellikka/presentation/phonebook/screens/single_phonebook.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../dto/no_data.dart';

class PhoneBook extends StatelessWidget {
  const PhoneBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(Uri url) async {
      await canLaunchUrl(url)
          ? await launchUrl(url)
          : throw "could not launch $url";
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(
            title: "Phone Book",
          ),
        ),
        body: SafeArea(
            child: GetBuilder<PhonebookController>(
          init: PhonebookController(),
          builder: (controller) {
            return controller.isLoading == true
                ? Center(
                    child: SpinKitFadingCircle(color: custom_green),
                  )
                : controller.phonebookData.success == false
                    ? const NoData(
                        message: "No Data Found",
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 3,
                          childAspectRatio: 1 / 1.2,
                          shrinkWrap: true,
                          children:
                              List.generate(controller.data.length, (index) {
                            final number = '${controller.data[index].mobile}';
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: InkWell(
                                onTap: () {
                                  userdata.write(
                                      'phone_no_id', controller.data[index].id);
                                  Get.to(
                                      SinglePhonebook(
                                        customerName:
                                            "${controller.data[index].firstName} ${controller.data[index].lastName}",
                                        phoneNumber:
                                            controller.data[index].mobile,
                                      ),
                                      arguments: controller.data[index].id);
                                },
                                child: Container(
                                  height: 265,
                                  width: 182,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFFFFFFF)),
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    controller.data[index].userImage != null &&
                                            controller.data[index].userImage!
                                                .isNotEmpty &&
                                            controller.data[index].userImage !=
                                                ''
                                        ? CircleAvatar(
                                            radius: 30,
                                            backgroundColor:
                                                const Color(0xFFCFF1D5),
                                            child: ClipOval(
                                                child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://nodeapitest.nellikkastore.com/uploads/customers_images/${controller.data[index].userImage}",
                                              fit: BoxFit.cover,
                                              filterQuality: FilterQuality.high,
                                              //Image.asset(controller.data[index].userImage.toString(),)
                                            )))
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundColor:
                                                const Color(0xFFCFF1D5),
                                            child: ClipOval(
                                                child: Text(
                                              controller
                                                  .data[index].firstName![0]
                                                  .toUpperCase()
                                                  .toString(),
                                            ))),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${controller.data[index].firstName} '
                                          ' ${controller.data[index].lastName}',
                                          style: GoogleFonts.mulish(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF59597C)),
                                        ),
                                        Text(
                                          controller.data[index].privilage
                                              .toString(),
                                          style: GoogleFonts.mulish(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF8A8A8A)),
                                        ),
                                        Text(
                                          controller.data[index].mobile
                                              .toString(),
                                          style: GoogleFonts.mulish(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF8A8A8A)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.callStaffApi(number);
                                        Get.snackbar('Calling  ',
                                            controller.data[index].firstName.toString());
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: const Color(0xFFCFF1D5)
                                            .withOpacity(.5),
                                        child: Image.asset(
                                          "assets/images/phonebook-call.png",
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
          },
        )));
  }
}
