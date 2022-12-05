import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/complaints/complaints.dart';
import 'package:nellikka/presentation/contact_us/contact.dart';
import 'package:nellikka/presentation/phonebook/screens/phonebook.dart';
import 'package:nellikka/presentation/profile/screens/profile.dart';
import 'package:nellikka/presentation/wallet/screens/wallet.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';


class MiddileLayer extends StatelessWidget {
  const MiddileLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 57.0, right: 57, top: 55),
      child: SizedBox(      
        //padding: const EdgeInsets.only(left: 20.0, right: 20, top: 55),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) =>  WasteRequestScreen()));
                        },
                        child: SizedBox(
                          height: 53,
                          width: 53,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF5E88E5),
                            radius: 20,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(
                                "assets/images/request.png",
                                width: 25,
                                height: 25,
                                color: const Color(0xFF5E88E5),
                              ),
                            ),
                          ),
                        ),
                      ),
                       Text(
                        'Request',
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF59597C),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                         onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const Complaints()));
                      },

                        child: SizedBox(
                          height: 53,
                          width: 53,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF5E88E5),
                            radius: 20,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(
                                "assets/images/complaint1.png",
                                width: 25,
                                height: 25,
                                color: const Color(0xFF5E88E5),
                              ),
                            ),
                          ),
                        ),
                      ),
                       Text(
                        'Complaints',
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF59597C),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PhoneBook()));
                        },
                        child: SizedBox(
                          height: 53,
                          width: 53,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF5E88E5),
                            radius: 20,
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor: const Color(0xFFFFFFFF),
                                child: Image.asset(
                                  "assets/images/phone-call.png",
                                  width: 25,
                                  height: 25,
                                  color: const Color(0xFF5E88E5),
                                )),
                          ),
                        ),
                      ),
                       Text(
                        'Phone Book',
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF59597C),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const ProfileScreen()));
                      },
                      child: SizedBox(
                        height: 53,
                        width: 53,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF5E88E5),
                          radius: 20,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xFFFFFFFF),
                            child: Image.asset(
                              "assets/images/profile.png",
                              width: 25,
                              height: 25,
                              color: const Color(0xFF5E88E5),
                            ),
                          ),
                        ),
                      ),
                    ),
                     Text(
                      'Profile',
                      style: GoogleFonts.mulish(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF59597C),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const WalletScreen()));
                      },
                      child: SizedBox(
                        height: 53,
                        width: 53,
                        child: CircleAvatar(
                          backgroundColor:const Color(0xFF5E88E5),
                          radius: 20,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:const Color(0xFFFFFFFF),
                            child: Image.asset(
                                "assets/images/wallet.png",
                                width: 25,
                                height: 25,
                                color: const Color(0xFF5E88E5),
                              ),
                          ),
                        ),
                      ),
                    ),
                     Text(
                      'Wallet',
                      style: GoogleFonts.mulish(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF59597C),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute(builder: (context) => const Contact()));
                      },
                      child: SizedBox(
                        height: 53,
                        width: 53,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF5E88E5),
                          radius: 20,
                          child: CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFFFFFFFF),
                              child: Image.asset(
                                "assets/images/contactus_icon.png",
                                width: 25,
                                height: 25,
                                color: const Color(0xFF5E88E5),
                              )),
                        ),
                      ),
                    ),
                     Text(
                      'Contact Us',
                      style: GoogleFonts.mulish(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF59597C),
                      ),
                    )
                  ],
                ),
              ]),
            ]),
      ),
    );
  }
}
