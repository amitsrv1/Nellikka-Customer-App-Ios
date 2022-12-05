import 'package:flutter/material.dart';
import 'package:nellikka/presentation/bottom_nav/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    //int selectedIndex = 1;
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                MainPage.indexChangeNotifier.value = index;
                // Navigator.of(context)
                // .push(MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                //indexChangeNotifier.value = index;
                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(
                fontSize: 8,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 8,
              ),
              unselectedItemColor: const Color(0xFF59597C),
              selectedIconTheme: const IconThemeData(
                color: Color(0xFF59597C),
              ),
              unselectedIconTheme: const IconThemeData(
                color: Color(0xFF59597C),
              ),
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Color(0Xff59597C),
                      size: 30,
                    ),
                    label: 'HOME'),
                const BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        "assets/images/request.png",
                      ),
                      color: Color(0Xff59597C),
                      size: 30,
                    ),
                    label: 'REQUEST'),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    label: 'UPDATES'),
                const BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/visitor.png"),
                      color: Color(0Xff59597C),
                      size: 30,
                    ),
                    label: 'VISIT LOG'),
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        // String url =
                        //     "https://api.whatsapp.com/send?phone=75940511&text=Hello&source=&data=&app_absent=";
                        // try {
                        //   launchUrl(Uri.parse(url),
                        //       mode: LaunchMode.externalApplication);
                        // } catch (e) {
                        //   //showBottomSheet(context: context, isErrorTrue: true, title: 'Unable to open whatsapp');
                        //   showBottomSheet({
                        //     required BuildContext context,
                        //     required bool isErrorTrue,
                        //   }) {
                        //     Flushbar(
                        //       flushbarPosition: FlushbarPosition.TOP,
                        //       backgroundColor:
                        //           isErrorTrue ? Colors.red : Colors.green,
                        //       duration: const Duration(seconds: 3),
                        //       messageText: const Text(
                        //         "Unable to Make a Call",
                        //         style: TextStyle(
                        //           fontSize: 16.0,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ).show(context);
                        //   }
                        // }
                      },
                      child: const ImageIcon(
                        AssetImage("assets/images/phone-call.png"),
                        color: Color(0Xff59597C),
                        size: 26,
                      ),
                    ),
                    label: 'CALL'),
              ]);
        });
  }
}
