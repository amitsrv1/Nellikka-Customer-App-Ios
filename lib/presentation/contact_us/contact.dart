import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
     Future<void> launchURL(Uri url) async {
    await canLaunchUrl(url)
     ? await launchUrl(url)   
      :throw "could not launch $url";    
  }
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Center(child: AppBarWidget(title: "Contact Us")),
        ),
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "NELLIKKA",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      color: Color.fromARGB(255, 54, 165, 69),
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Text(
                    "Get in Touch",
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    children: [
                      Icon(Icons.location_pin),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Nellikka Complete Solutions Pvt Ltd",
                        style: GoogleFonts.mulish(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
              
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:28.0),
                  child: Text(
                    "3rd Floor, KK Trade Centre,",
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:28.0),
                  child: Text(
                    "New Bus Stand,",
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:28.0),
                  child: Text(
                    "Thavakkara,",
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:28.0),
                  child: Text(
                    "Kannur, Kerala -670002",
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/phone-call.png",
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "9846816916, 9349444445",
                      style: GoogleFonts.mulish(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "info@nellikka.in",
                      style: GoogleFonts.mulish(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/www.png",
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                    onTap: () async {
                      Uri url = Uri.parse('https://nellikka.in/');
                      if (await canLaunchUrl(url)) {
                        await launchURL(url);
                      }
                    },
                      child: Text(
                        "www.nellikkastore.com",
                        style: GoogleFonts.mulish(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ])));
  }
}
