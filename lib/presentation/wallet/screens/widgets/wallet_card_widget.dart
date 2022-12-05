import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/dto/walletLogDto/controller/wallet_controller.dart';
import 'package:get/get.dart';
import 'package:nellikka/presentation/wallet/screens/add_cash.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 193,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage("assets/images/walletlogcard.png"),
              fit: BoxFit.cover)
          ),
      child: GetBuilder<WalletLogController>(
          init: WalletLogController(),
          builder: (controller) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 115,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF434368),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const AddCash()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              const Image(
                                  image: AssetImage(
                                      "assets/images/walletaddicon.png")),
                              //SizedBox(width: 3,),
                              Text(
                                "Add Cash",
                                style: GoogleFonts.mulish(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF9E9EDA)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0, top:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                     Text(
                      "My Balance",
                      style: GoogleFonts.mulish(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        //Text("₹",),
                        const Icon(
                          Icons.currency_rupee,
                          size: 25,
                          color: Color(0xFFFFFFFF),
                        ),
                       controller.custWalletBalance != null && controller.custWalletBalance != 'NaN'
                            && controller.custWalletBalance!.isNotEmpty
                        //UserInformation.read("cust_wallet_balance") != null
                        //?Text(controller.sum(),
                            ? Text('${controller.custWalletBalance!}',
                                // UserInformation.read("cust_wallet_balance")
                                //     .toString(),
                                style:  GoogleFonts.mulish(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFFFFFFFF)),
                              )                            
                            :  Text(                       
                                "0",
                                style: GoogleFonts.mulish(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFFFFFFFF)),
                              )
                          // if(controller.walletBalance != null) 
                          //       Text(
                          //       "${controller.walletBalance.custWalletBalance}",
                          //       style:  GoogleFonts.mulish(
                          //           fontSize: 45,
                          //           fontWeight: FontWeight.w300,
                          //           color: Color(0xFFFFFFFF)),
                          //     ) 
                          // else Text("0.0",
                          //   style: GoogleFonts.mulish(
                          //       fontSize: 45,
                          //       fontWeight: FontWeight.w300,
                          //       color: Color(0xFFFFFFFF))),
                      ],
                    ),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
