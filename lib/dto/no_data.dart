import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoData extends StatelessWidget {
  final String? message;
  const NoData({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
        children: [
          Image.asset("assets/images/no_data.png"),
          Text(
            message.toString(),
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff59597C))),
          )
        ],
      ),
      ),
    );
  }
}
