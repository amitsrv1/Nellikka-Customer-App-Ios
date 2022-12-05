import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/complaints/add_complaint_tab.dart';
import 'package:nellikka/presentation/complaints/complaint_status.dart';
import 'package:nellikka/presentation/waste_request/waste_request_tab.dart';
import 'package:nellikka/presentation/waste_request/waste_status_tab.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  PageController? pageController;

  int selectedIndex = 0;

  final List<Widget> listOfPages = [
   CustomerAddNewComplaint(),
    CustomerComplaintStatus(),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Complaints"),
        ),
        body: SafeArea(
          left: true,
          right: true,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
               Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                  child:
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              pageController!.jumpToPage(0);
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            width: 186.w,
                            height: 45.w,
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? const Color(0xff3FA54A)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xff3FA54A),
                              ),
                            ),
                            child:
                                Center(
                                  child: Text(
                                    "Add Complaint",
                                    style: GoogleFonts.mulish(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: selectedIndex == 0
                                          ? Colors.white
                                          : const Color(0xff3FA54A),
                                    ),
                                  ),
                                ),
                           
                          ),
                        ),
                    
                     GestureDetector(
                          onTap: () {
                            setState(() {
                              pageController!.jumpToPage(1);
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            width: 186.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? const Color(0xff3FA54A)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xff3FA54A),
                              ),
                            ),
                            child: 
                                Center(
                                  child: Text(
                                    "Complaint Status",
                                    style: GoogleFonts.mulish(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: selectedIndex == 1
                                          ? Colors.white
                                          : const Color(0xff3FA54A),
                                    ),
                                  ),
                                ),
                             
                          ),
                        ),
                     
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: listOfPages,
                    onPageChanged: (idx) {
                      setState(() {
                        selectedIndex = idx;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ));
  }
}
