import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/bottom_nav/main_page.dart';
import 'package:get/get.dart';
class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: const Color(0xFF3FA54A),
      leading: InkWell(
        onTap: () {
            // Get.offAllNamed('/main_page');
          // Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => MainPage()));
          // Navigator.of(context).pushReplacement(newRoute)
          //                             arguments:MainPage());
                      
          Navigator.of(context).pop();
        },
        
        child: const Icon(
          Icons.arrow_back,
          size: 25,
        ),
        //iconSize: 25,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontSize: 18,
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
