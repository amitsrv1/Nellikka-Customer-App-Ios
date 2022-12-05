import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/dto/generateTokenDto/controller.dart';
import 'package:nellikka/presentation/chat_box/screens/notification.dart';
import 'package:nellikka/presentation/dashboard/common/storage.dart';
import 'package:nellikka/presentation/dashboard/screens/widgets/bottom_layer.dart';
import 'package:nellikka/presentation/dashboard/screens/widgets/dashboard_header.dart';
import 'package:nellikka/presentation/dashboard/screens/widgets/middile_layer.dart';
import 'package:nellikka/presentation/side_menu/sidemenu_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

var userID;
final userdata = GetStorage();
FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  //FlutterAppBadger.removeBadge();
   FlutterAppBadger.updateBadgeCount(1);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  print('a message was received:${message.messageId}');
}

class DashBoardScreen extends StatefulWidget {
 const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  get userId => ModalRoute.of(context)?.settings.arguments;

  @override
  void didChangeDependencies() async {
    //print('${userdata.read('customerId')}');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    messaging.getInitialMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.offNamed('/chat-screen');
      
     
      
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Get.offNamed('/chat-screen');
      FlutterAppBadger.removeBadge();
    });

    PushNotification();

    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    GenerateTokenController().generateTokenf().then((response) {
      response.token;
      UserInformation.write('access_token', response.token);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: const BottomNavWidget(),
      //backgroundColor: const Color(0xFF35943F),
      drawer: const SideMenu(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: BuildAppBar(),
      ),
      body: SafeArea(
          child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height/2.70,
          width: MediaQuery.of(context).size.width,

          color: const Color(0xFF35943F),
          child: const DashboardHeader(),
        ),
        const MiddileLayer(),
        const SizedBox(height: 3),
        const BottomLayer(),
      ])),
    );
  }
}

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: const Color(0xFF35943F),
      elevation: 0,
      leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Builder(
              builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const ImageIcon(
                      AssetImage("assets/images/side_menu_bar.png"))))),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: SizedBox(
            height: 37,
            width: 37,
            child: Image.asset(
              "assets/images/logo.png",
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        const SizedBox(
          width: 3,
          //height: 25,
        ),
        Center(
          child: SizedBox(
              height: 22,
              width: 105,
              child: Text(
                "NELLIKKA".tr,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
              //child: Image.asset("assets/images/NELLIKKA1.jpg")
              ),
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
