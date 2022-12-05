//import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:nellikka/custom_colors.dart';
showAlertDialog(BuildContext context, String alertTitle, String alertMessage,
    continueMsg, dismissMsg, VoidCallback? onPressed) {
  // set up the buttons
    int selectedIndex = 0;

  Widget continueButton = SizedBox(
    height: 40,
    width: 125,
    child: CupertinoButton(
       borderRadius: BorderRadius.circular(5),
      color: const Color(0xff3FA54A),
      
      onPressed: onPressed,
      child: Center(child: Text(continueMsg,textAlign: TextAlign.center,style: GoogleFonts.mulish(color:background_white))),
    ),
  );
  Widget cancelButton = SizedBox(
     height: 40,
    width: 125,
    child: CupertinoButton(
    color: const Color(0xFFFFFFFF),
      child:Text(dismissMsg,textAlign: TextAlign.center,style: GoogleFonts.mulish(color:custom_green),),
      onPressed: () {
        Navigator.pop(context);
      },
      
    ),
  );

  // set up the AlertDialog
  CupertinoAlertDialog alert =  CupertinoAlertDialog(
    title: Center(child: Text(alertTitle,style: GoogleFonts.mulish(color:custom_green,fontWeight: FontWeight.w800))),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[Text(alertMessage,textAlign:TextAlign.center,style: GoogleFonts.mulish(color:const Color(0xff8A8A8A),))],
      ),
    ),
    actions: [
      continueButton,
      cancelButton,
    ],
  );

  // show the dialog
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

