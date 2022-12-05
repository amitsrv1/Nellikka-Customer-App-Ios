//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/invoice/screens/invoice_list.dart';
import 'package:nellikka/presentation/receipt/screens/receipt_list.dart';
import 'package:nellikka/presentation/wallet/screens/widgets/list_card_details_widget.dart';

class WalletMiddileLayer extends StatelessWidget {
  const WalletMiddileLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 370,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                                              height: 52,
                                              width: 52,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFF4ABEFF),
                                              ),
                                              child: Image.asset(
                                                "assets/images/invoice1.png",
                                                width: 20,
                                                height: 20,
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
                                              height: 52,
                                              width: 52,
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
                                                      const WalletCardListdDetails()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 52,
                                              width: 52,
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
      ]),
    );
  }
}
