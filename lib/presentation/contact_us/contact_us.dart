import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: Center(
                  child: Text(
                'Get in Touch',
                style: GoogleFonts.mulish(
                  fontSize: 25,
                  fontWeight: FontWeight.w800
                ),
                textAlign: TextAlign.center,
              )),
            )
          ],
        ),
      ),
    );
  }
}
