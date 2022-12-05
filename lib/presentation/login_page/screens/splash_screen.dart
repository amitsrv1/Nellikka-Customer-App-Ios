// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/StringValues.dart';
import 'package:nellikka/presentation/dashboard/screens/dashboard.dart';
import 'package:nellikka/presentation/login_page/screens/login.dart';
import 'package:nellikka/routes.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../bottom_nav/main_page.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({Key? key}) : super(key: key);

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen>
    with TickerProviderStateMixin {
  final userdata = GetStorage();
  @override
  void initState() {
    userdata.writeIfNull('isLogged', false);
    Future.delayed(const Duration(microseconds: 3000), () async {
      //navigate();
      startTimer();
    });

    // startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(
                'assets/images/599 1.jpg',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              width: 414,
              height: 258,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(28),
                child: Image.asset(
                  'assets/images/logo.png',
                  filterQuality: FilterQuality.high,
                ),
                width: 213.69,
                height: 213.69,
              ),
            ),
          ),
          Text(
             StringValues.appName.toUpperCase(),
              style: GoogleFonts.montserrat(
                  //color: Color(0x64B946),
                  color: Color.fromRGBO(100, 185, 70, 1)
,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                child: Image.asset(
                  'assets/images/599 2.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                width: 434,
                height: 268,
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTimer() {
    var _duration = const Duration(seconds: 0, milliseconds: 1000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    userdata.read('isLogged')
        ? Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: Duration(seconds: 10),
            pageBuilder: (_, __, ___) => MainPage()))
        : Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: Duration(seconds: 10),
            pageBuilder: (_, __, ___) => LoginScreeen()));
  }
}
