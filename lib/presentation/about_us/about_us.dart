import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
   var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "About Us"),
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Column(children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SizedBox(
            //     width: w,
            //     // height: h*.7,
            //     child: Image.asset("assets/images/chat_image.png",fit: BoxFit.cover),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Container(
                        width:290,
                        height: 30,
                        decoration: BoxDecoration(
                          color:  const Color(0xffE5FFE9),
                          borderRadius: BorderRadius.circular(5)
                          
                        ),
                        
                        child: const Padding(
                          padding: EdgeInsets.only(left:8.0,right:8,top:5,bottom:5),
                          child: Text(
                            "Complete Waste Management System",
                            style: TextStyle(color: Color(0xff3FA54A), fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "To reduces the effect of waste on the environment, health, and so on",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff59597C)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   const Text(
                    textAlign: TextAlign.justify,
                    "The improper handling of different types of waste materials and shoddy disposal methods can result in serious medical conditions. If you do not follow the right kind of waste management practices, it can result in extensive air and land pollution. The improper handling of different types of waste materials and shoddy disposal methods can result in serious medical conditions. If you do not follow the right kind of waste management practices, it can result in extensive air and land pollution. The improper handling of different types of waste materials and shoddy disposal methods can result in serious medical conditions. If you do not follow the right kind of waste management practices, it can result in extensive air and land pollution.",
                  style: TextStyle(color: Color(0xff626262)),),
                  const SizedBox(height: 10),             
                ],
              ),
            )
          ]),
        )),
        );
  }
}