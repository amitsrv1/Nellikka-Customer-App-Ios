import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/presentation/chat_box/screens/chat_box.dart';
import 'package:nellikka/presentation/dashboard/screens/dashboard.dart';
import 'package:nellikka/presentation/phonebook/screens/phonebook.dart';
import 'package:nellikka/presentation/visit_log/screens/visit_log.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  static ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

  final _pages = [
    const DashBoardScreen(),
    WasteRequestScreen(),
    const ChatBox(),
    VisitLogScreen(),
    const PhoneBook()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            print(index);
            return _pages[index];
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
             Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const ChatBox()));
          },
          backgroundColor:  background_white,
          tooltip: 'UPDATES',
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/updates.png",
                  color: const Color(0xFF59597C),
                  width: 30,
                  height: 30,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo1.png",
                  width: 15,
                  height: 15,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: 
        Padding(
          padding: const EdgeInsets.only(left:0.0,right: 25),
          child: Container(
            height: 50,
            color:background_white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                        width: 25,
                        child: ImageIcon(
                          AssetImage(
                            "assets/images/home.png",
                          ),
                          color: Color(0Xff59597C),
                          size: 30,
                        ),
                      ),
                     const SizedBox(height: 8,),
                      Text("HOME",
                      style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 8,
                          color: Color(0xFF59597C)
                        )
                      ),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>WasteRequestScreen()));
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                         height: 25,
                        width: 25,
                        child: ImageIcon(
                          AssetImage(
                            "assets/images/request.png",
                          ),
                          color: Color(0Xff59597C),
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text("REQUEST",
                       style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 8,
                           color: Color(0xFF59597C)
                        )
                      ),)
                    ],
                  ),
                ),
               GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>const ChatBox()));
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 25,),
                      Text('UPDATES',
                       style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 8,
                           color: Color(0xFF59597C)
                        )
                      ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>VisitLogScreen()));
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                         height: 25,
                        width: 25,
                        child: ImageIcon(
                          AssetImage("assets/images/visitor.png"),
                          color: Color(0Xff59597C),
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text('VISIT LOG',
                       style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 8,
                           color: Color(0xFF59597C)
                        )
                      ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                         Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const PhoneBook()));
                      },
                  child: Column(
                    children: [
                      const SizedBox(
                         height: 25,
                        width: 25,
                        child: ImageIcon(
                          AssetImage("assets/images/phone-call.png"),
                          color: Color(0Xff59597C),
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text('CALL',
                       style: GoogleFonts.mulish(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 8,
                           color: Color(0xFF59597C)
                        )
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
