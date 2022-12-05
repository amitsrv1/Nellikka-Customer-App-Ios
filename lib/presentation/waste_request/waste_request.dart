import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/complaints/add_complaint_tab.dart';
import 'package:nellikka/presentation/waste_request/waste_request_tab.dart';
import 'package:nellikka/presentation/waste_request/waste_status_tab.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';

class WasteRequestScreen extends StatefulWidget {
  WasteRequestScreen({Key? key, }) : super(key: key);
 // int? selctedValue;
  @override
  _WasteRequestScreenState createState() => _WasteRequestScreenState();
}

class _WasteRequestScreenState extends State<WasteRequestScreen> {
  PageController? pageController;

  int selectedIndex = 0;

  final List<Widget> listOfPages = [
    const WasteRequestView(),
    const WasteStatusTab(),
  ];

  @override
  void initState() {
    //if(selectedValue !=null)selectedIndex = widget.selctedValue!;
    pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Waste Request"),
        ),
        body: SafeArea(
          left: true,
          right: true,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                child: Row(
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
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? const Color(0xff3FA54A)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff3FA54A),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Request",
                            style: GoogleFonts.mulish(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : const Color(0xff3FA54A),
                            ),
                            textAlign: TextAlign.center,
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
                        child: Center(
                          child: Text(
                            "Request Status",
                            textAlign: TextAlign.center,
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
              const SizedBox(
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
        ));
  }
}
