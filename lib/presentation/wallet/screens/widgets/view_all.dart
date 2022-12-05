import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/dto/walletLogDto/controller/wallet_controller.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/list_card_details_widget.dart';
import 'package:get/get.dart';

class ViewAllWallet extends StatelessWidget {
  const ViewAllWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WalletLogController>(
          init: WalletLogController(),
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: SpinKitFadingCircle(color: custom_green),
                  )
                : controller.walletLogModel.walletLog == null || controller.walletLogModel.walletLog!.length == 0 || controller.walletLogModel.walletLog!.isEmpty == true 
                  ? const Center(
                        child: NoData(
                          message: "No Data Found",
                        ),
                      )
                    :  Visibility(
                      visible: controller.walletLogModel.walletLog!.length > 0,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text(
                                  "Previous Transactions Details",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    color: const Color(0xFF3FA54A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                          title: Text(
                                              controller
                                                  .walletLog[index].wlogMessage
                                                  .toString(),
                                              style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF59597C),
                                              )),
                                          subtitle: SizedBox(
                                            height: 18,
                                            width: 150,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${controller.walletLog[index].date}",
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xFF969696),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${controller.walletLog[index].wlogTime}",
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xFF969696),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          trailing: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.currency_rupee,
                                                      size: 20,
                                                      color: Color(0xFF59597C),
                                                    ),
                                                    controller.walletLog[index]
                                                                .wlogAmount !=
                                                            null
                                                        ? Text(
                                                            "${controller.walletLog[index].wlogAmount}",
                                                            style: GoogleFonts.mulish(
                                                                color: const Color(
                                                                    0xFF59597C),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        : Text(
                                                            "0",
                                                            style: GoogleFonts.mulish(
                                                                color: const Color(
                                                                    0xFF59597C),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                  ],
                                                ),
                                                Text(
                                                    controller.walletLog[index]
                                                                .wlogType
                                                                 ==
                                                            "0"
                                                        ? "Debit"
                                                        : "Credit",
                                                    style: GoogleFonts.mulish(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w600,
                                                      color: controller
                                                                  .walletLog[index]
                                                                  .wlogType
                                                                   ==
                                                              "0"
                                                          ? const Color(0xffED7D2B)
                                                          : const Color(0xff3FA54A),
                                                    ))
                                              ],
                                            ),
                                          ));
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10.0, right: 10),
                                      child: Divider(
                                        thickness: 1,
                                        color: Color(0xFF8A8A8A),
                                      ),
                                    ),
                                    itemCount: controller.walletLog.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    );
          }),
    );
  }
}
