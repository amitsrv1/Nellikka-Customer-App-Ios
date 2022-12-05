import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/dto/walletAddCashDto/add_cash_controller.dart';
import 'package:nellikka/dto/walletAddCashDto/add_cash_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

bool isButtonDisabled = true;

class AddCash extends StatefulWidget {
  const AddCash({super.key});

  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  final AddWalletModel addWalletModel = AddWalletModel();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
       backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        navigationBar:  CupertinoNavigationBar(
         // elevation: 0,
          backgroundColor: transparent_color,
          leading:  CupertinoButton(
            onPressed: () {
              //Get.offAllNamed('/wallet-screen');
              Navigator.of(context).pop();
            },
            child: Icon(CupertinoIcons.back,
            color: custom_black,
            size: 25),
          ),
        ),
        child: Center(
            child: GetBuilder<AddWalletController>(
                init: AddWalletController(),
                builder: (controller) {
                  controller.update();
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 100,
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 8),
                                  child: Text(
                                    'Nellika Money'.toUpperCase(),
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 8),
                                  child: Text(
                                    'Available Balance:\t ${MoneysStorage.read('cust_wallet_balance') == 'NaN' ? '₹0' : MoneysStorage.read('cust_wallet_balance')}',
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Text('You can add upto ₹9,000  ',
                                //     style: GoogleFonts.mulish(
                                //         fontWeight: FontWeight.normal))
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: CupertinoTextField(
                            controller:controller.amount ,
                            onChanged: (value) {
                              setState(() {
                                isButtonDisabled = value.length < 1;
                              });
                            },
                            inputFormatters: <TextInputFormatter>[
                              NumberTextInputFormatter(
                                integerDigits: 10,
                                //decimalDigits: 2,
                                maxValue: '50000',
                                decimalSeparator: '.',
                                groupDigits: 4,
                                groupSeparator: ',',
                                allowNegative: false,
                                overrideDecimalPoint: true,
                                insertDecimalPoint: false,
                                insertDecimalDigits: true,
                              ),
                            ],
                            autofocus: true,
                            cursorColor: custom_green,
                            keyboardType: TextInputType.number,
                            placeholder: 'Enter Amount'.toUpperCase(),
                            placeholderStyle: GoogleFonts.mulish(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 146, 142, 142)),
                            decoration: BoxDecoration(
                              // contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              // focusColor: Colors.greenAccent,
                              // hoverColor: Colors.greenAccent,
                              // labelText: 'Enter Amount'.toUpperCase(),
                              // labelStyle: GoogleFonts.mulish(
                              //     fontSize: 15,
                              //     color: const Color.fromARGB(255, 146, 142, 142)),
                              // focusedBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(
                                //   width: 3,
                                //   style: BorderStyle.solid,
                                //   color: Color.fromARGB(255, 128, 236, 124),
                                // ),
                              ),
                              prefix: Text('₹',
                                  style: GoogleFonts.mulish(
                                      fontSize: 16,
                                      color:
                                          const Color.fromARGB(255, 110, 110, 110))),
                              //label: Text('Enter Amount',style: GoogleFonts.mulish(fontSize: 12),),
                              // border: const UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //     color: Color(0xffB8D0D6),
                              //   ),
                              // ),
                              //hintText: "enter amount",
                              // hintStyle: GoogleFonts.mulish(
                              //   fontWeight: FontWeight.w600,
                              //   fontSize: 20.sp,
                              //   color: const Color(0xff959FB4),
                              // ),
                            ),
                            // controller: controller.amount,
                            // style: GoogleFonts.mulish(
                            //   fontWeight: FontWeight.w600,
                            //   fontSize: 22.sp,
                            //   color: const Color(0xff626262),
                            // ),
                            //textInputAction: TextInputAction.done,
                          ),
                       // ),
                        //{controller.addWalletModel.data!.amount.toString()}",textAlign: TextAlign.center,)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 55,
                            width: 360,
                            margin: const EdgeInsets.all(22),
                            padding: const EdgeInsets.only(top: 10),
                            child: CupertinoButton(
                              disabledColor: Color.fromARGB(255, 91, 150, 97) ,
                              color: const Color(0xFF3FA54A),
                                // style: ElevatedButton.styleFrom(
                                //     backgroundColor: const Color(0xFF3FA54A),
                                //     disabledBackgroundColor:
                                //         const Color.fromARGB(255, 91, 150, 97),
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(5))),
                                onPressed: isButtonDisabled
                                    ? null
                                    : () async {
                                        controller.openGateway();
                                       // controller.amount.clear();
                                      },
                                child: Text(
                                  'Proceed To Add Money'.toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                      ]);
                })));
  }
}
