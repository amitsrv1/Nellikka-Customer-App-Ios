import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/no_data.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/list_card_details_widget.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/middile_layer.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/view_all.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/wallet_card_widget.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:get/get.dart';
import '../../../dto/walletLogDto/controller/wallet_controller.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Wallet"),
        ),
        body: ListView(
          children: [
            SafeArea(
                child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: WalletCardWidget(),
              ),
              const SizedBox(
                height: 5,
              ),
              const WalletMiddileLayer(),
              const SizedBox(
                height: 5,
              ),
              GetBuilder<WalletLogController>(
                  init: WalletLogController(),
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
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 414,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0, right: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Previous Transactions",
                                            style: GoogleFonts.mulish(
                                              color: const Color(0xFF3FA54A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ViewAllWallet()));
                                            },
                                            child: Text(
                                              "View all",
                                              style: GoogleFonts.mulish(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xFF5E88E5)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              title: Text( controller.walletLog[index].wlogMessage.toString(),
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xFF59597C),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFF969696),
                                                      ),
                                                    ),
                                                   const SizedBox(width: 5,),
                                                   Text(
                                                        "${controller.walletLog[index].wlogTime}",
                                                        style: GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF969696),
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
                                                          color:
                                                              Color(0xFF59597C),
                                                        ),
                                                        controller
                                                                    .walletLog[
                                                                        index]
                                                                    .wlogAmount !=
                                                                null 
                                                            ? Text(
                                                                "${controller.walletLog[index].wlogAmount}",
                                                                style: GoogleFonts.mulish(
                                                                    color: const Color(
                                                                        0xFF59597C),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            : Text(
                                                                "0",
                                                                style: GoogleFonts.mulish(
                                                                    color: const Color(
                                                                        0xFF59597C),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                      ],
                                                    ),
                                                    Text(
                                                        controller
                                                                    .walletLog[
                                                                        index]
                                                                    .wlogType
                                                                    .toString() ==
                                                                "0"
                                                            ? "Debit"
                                                            : "Credit",
                                                        style:
                                                            GoogleFonts.mulish(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: controller
                                                                      .walletLog[
                                                                          index]
                                                                      .wlogType
                                                                      .toString() ==
                                                                  "0"
                                                              ? const Color(
                                                                  0xffED7D2B)
                                                              : const Color(
                                                                  0xff3FA54A),
                                                        ))
                                                  ],
                                                ),
                                              ));
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 10),
                                              child: Divider(
                                                thickness: 1,
                                                color: Color(0xFF8A8A8A),
                                              ),
                                            ),
                                        itemCount: controller.walletLog.length > 5
                                            ? 5
                                            : controller.walletLog.length,
                                        ),
                                  ),
                                ],
                              );
                  })
            ])),
          ],
        ));
  }
}
