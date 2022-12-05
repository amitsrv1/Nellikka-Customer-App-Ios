import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
          return CupertinoTabBar(
             onTap: (index) {
            MainPage.indexChangeNotifier.value = index;
          },
           currentIndex: newIndex,
          backgroundColor: Colors.white,
          activeColor: Colors.black,
         
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
                  onTap: () {},
                  child: const ImageIcon(
                    AssetImage("assets/images/phone-call.png"),
                    color: Color(0Xff59597C),
                    size: 26,
                  ),
                ),
                label: 'CALL'),
          ]);
         
        
          // selectedLabelStyle: const TextStyle(
          //   fontSize: 8,
          // ),
          // unselectedLabelStyle: const TextStyle(
          //   fontSize: 8,
          // ),
          // unselectedItemColor: const Color(0xFF59597C),
          // selectedIconTheme: const IconThemeData(
          //   color: Color(0xFF59597C),
          // ),
          // unselectedIconTheme: const IconThemeData(
          //   color: Color(0xFF59597C),
          // ),
        });
  }
}
