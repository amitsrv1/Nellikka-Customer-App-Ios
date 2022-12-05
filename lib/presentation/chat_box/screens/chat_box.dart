import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/notificationListDto/controller.dart';
import 'package:nellikka/dto/notificationListDto/model.dart';
import 'package:nellikka/dto/wasteRequestStatusDto/model.dart';
import 'package:nellikka/presentation/widgets/App_bar/appbar_widget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(250, 241, 240, 240),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Chat Box"),
        ),
        //appBar: AppBar(centerTitle: true,backgroundColor: Color.fromARGB(220, 62, 224, 12).withOpacity(0.9),
        // title: Text('Notification',style: GoogleFonts.mulish(color: Colors.white),),
        // ),
        body: GetBuilder<NofificationListController>(
            init: NofificationListController(),
            builder: (controller) {
              return Stack(
                children: [
                  Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/chat_back_ground.png"),
                            fit: BoxFit.cover,
                          ))),
                  Column(children: [
                    newWidget(controller),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         height: 50,
                    //         width: 300,
                    //         color: const Color(0xFFFFFFFF),
                    //         child: TextField(
                    //           decoration: InputDecoration(
                    //             suffixIcon: const ImageIcon(
                    //               AssetImage("assets/images/chat.png"),
                    //               color: Color(0xFFABABAB),
                    //             ),
                    //             contentPadding: const EdgeInsets.all(12),
                    //             border: OutlineInputBorder(
                    //                 borderSide: const BorderSide(
                    //                     color: Color(0xFFBABABA)),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             focusedBorder: const OutlineInputBorder(
                    //                 borderSide: BorderSide(
                    //               color: Color(0xFFBABABA),
                    //             )),
                    //             hintText: "Type here..",
                    //           ),
                    //           onSubmitted: (text) {
                    //             // final message = Message(
                    //             //   date: DateTime.now(),
                    //             //   text: text,
                    //             //   isSendByMessage: true,
                    //             // );
                    //             // setState(() {
                    //             //   messages.add(message);
                    //             // });
                    //           },
                    //         ),
                    //       ),
                    //       const SizedBox(width: 2),
                    //       CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: const Color(0xFF959FB4),
                    //         child: Image.asset(
                    //           "assets/images/chat2.png",
                    //           color: const Color(0xFFFFFFFF),
                    //           width: 22,
                    //           height: 22,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ]),
                ],
              );
            }));
  }

  //);
}

Widget newWidget(NofificationListController notificationListController) {
  List<Datum>? data = notificationListController.data;
  return notificationListController.isLoading
      ? const Center(
          child: Center(
            child: SpinKitFadingCircle(color: custom_green),
          ),
        )
      : notificationListController.hasData == false
          ? const Center(
              child: Center(
                child: SpinKitFadingCircle(color: custom_green),
              ),
            )
          : Expanded(
              child: GroupedListView<Datum, DateTime>(
                padding: const EdgeInsets.all(8),
                elements: data!,
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                groupBy: (message) => DateTime(
                    message.notificationDate!.year,
                    message.notificationDate!.month,
                    message.notificationDate!.day),
                groupHeaderBuilder: (message) {
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: message.notificationDate == null
                              ? const Text('Nill')
                              : Text(
                                  DateFormat.yMMMd()
                                      .format(message.notificationDate!),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                    color:
                                        const Color.fromRGBO(171, 171, 171, 1),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
                itemBuilder: (context, message) {
                  notificationTime() {
                    DateFormat tFormat = DateFormat("hh.mm a");
                    DateTime parseTime =
                        DateFormat("HH:mm:ss").parse(message.notificationTime!);
                    String formattedTime = tFormat.format(parseTime);
                    return formattedTime;
                  }                  
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 5, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFF9F9F9),
                          border: Border.all(
                            color: const Color(0xFFFFFFFF),
                          )
                          //color: Colors.grey
                          ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 5,top: 5),
                              child: Text(
                                'Nellikka',
                                style: GoogleFonts.mulish(
                                  color: Color.fromRGBO(53, 148, 63, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                message.notificationMessage.toString(),
                                style: GoogleFonts.mulish(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(71, 71, 71, 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            message.notificationImage == null ||
                                    message.notificationImage == ''
                                ? Container()
                                : Center(
                                   // padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://nodeapitest.nellikkastore.com/uploads/notification_images/${message.notificationImage}",
                                      width: 205.w,
                                      height: 287.h,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, right: 8),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(notificationTime().toString(),
                                    style: GoogleFonts.mulish(
                                        color: Color.fromRGBO(171, 171, 171, 1),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11)),
                              ),
                            )
                          ]),
                    ),
                  );
                  // return Align(
                  //   child: Column(
                  //     children: [
                  //       // Align(
                  //       //   alignment: Alignment.topLeft,
                  //       //   child: ClipOval(
                  //       //     child: Image.asset("assets/images/logo.png",
                  //       //         width: 34.w,
                  //       //         height: 34.h,
                  //       //         alignment: Alignment.topLeft),
                  //       //   ),
                  //       // ),
                  //       Container(
                  //           width: 300,
                  //           child: Card(
                  //               clipBehavior: Clip.antiAliasWithSaveLayer,
                  //               color: const Color.fromARGB(255, 250, 249, 248),
                  //               //elevation: 0,
                  //               child: Column(
                  //                 children: [
                  //                   ListTile(
                  //                     // trailing: Text(
                  //                     //     notificationTime().toString(),
                  //                     //     style:
                  //                     //         GoogleFonts.mulish(fontSize: 10)),
                  //                     title: Text(
                  //                       'Nellikka',
                  //                       style: GoogleFonts.mulish(
                  //                         color: Color.fromRGBO(53, 148, 63, 1),
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.w700,
                  //                       ),
                  //                     ),
                  //                     subtitle: Text(
                  //                       message.notificationMessage.toString(),
                  //                       style: GoogleFonts.mulish(
                  //                         fontSize: 13,
                  //                         fontWeight: FontWeight.w600,
                  //                         color: const Color.fromRGBO(
                  //                             71, 71, 71, 1),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   message.notificationImage == null ||
                  //                           message.notificationImage == ''
                  //                       ? Container()
                  //                       : Padding(
                  //                           padding: const EdgeInsets.all(8.0),
                  //                           child: CachedNetworkImage(
                  //                             imageUrl:
                  //                                 "https://nodeapitest.nellikkastore.com/uploads/notification_images/${message.notificationImage}",
                  //                             width: 205.w,
                  //                             height: 287.h,
                  //                             filterQuality: FilterQuality.high,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                         ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.only(
                  //                         bottom: 8.0, right: 8),
                  //                     child: Align(
                  //                       alignment: Alignment.bottomRight,
                  //                       child: Text(
                  //                           notificationTime().toString(),
                  //                           style: GoogleFonts.mulish(
                  //                               color: Color.fromRGBO(
                  //                                   171, 171, 171, 1),
                  //                               fontWeight: FontWeight.w600,
                  //                               fontSize: 11)),
                  //                     ),
                  //                   )
                  //                 ],
                  //               ))),
                  //     ],
                  //   ),
                  // );
                },
              ),
            );
}
