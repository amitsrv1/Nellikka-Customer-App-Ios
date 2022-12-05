import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:nellikka/dto/storage.dart';
import 'package:nellikka/localeString.dart';
import 'package:nellikka/presentation/bottom_nav/main_page.dart';
import 'package:nellikka/presentation/chat_box/screens/chat_box.dart';
import 'package:nellikka/presentation/chat_box/screens/notification.dart';
import 'package:nellikka/presentation/login_page/screens/login.dart';
import 'package:nellikka/presentation/login_page/screens/otp_screen.dart';
import 'package:nellikka/presentation/login_page/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/presentation/wallet/screens/wallet.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';
import 'package:nellikka/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  print('a message was received:${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotification();
// try {
// 	await FlutterDynamicIcon.setApplicationIconBadgeNumber(20);
// } on PlatformException {} catch (e) {}

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  

  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
 // VoidCallback rebuildOnLocaleChange() => () => setState(() {});
  @override
  Widget build(BuildContext context) {
     Locale myLocale = window.locale;
    //PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();
   // VoidCallback rebuildOnLocaleChange() => () => setState(() {});
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Nellikka Customer App',
        debugShowCheckedModeBanner: false,
        locale: LangStorage.read("val") == null
            ? const Locale('en', 'US')
            : LangStorage.read("val") == 1
                ? const Locale('en', 'US')
                : const Locale('ml', 'ML'),
        translations: LocaleString(),
        routes: {
          NavRoute.dashboard: ((context) => MainPage()),
          NavRoute.otpScreen: ((context) => const MyOTPScreen()),
          NavRoute.loginScreen: ((context) => const LoginScreeen()),
           NavRoute.main_page: ((context) => MainPage()),
          NavRoute.wasteRequestScreen: ((context) =>
               WasteRequestScreen()),
          NavRoute.chatScreen: ((context) => const ChatBox()),
           NavRoute.walletScreen: ((context) => const WalletScreen()),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          
          fontFamily: myLocale.languageCode == "en" ?GoogleFonts.mulish().fontFamily: GoogleFonts.mulish(fontWeight: FontWeight.normal).fontFamily,
        ),
        home: const SplahScreen(),
      ),
    );
  }
}
