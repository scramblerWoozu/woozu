import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/home_page.dart';
import 'package:woozu/pages/partner_page.dart';
import 'package:woozu/pages/settings.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //내 데이터를 받아와서 MyInfo 프로바이더에 담아둠

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
          children: [
            HomePage(),
            PartnerPage(),
            Settings(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex, // 현재 보여주는 탭
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: selectedIconColor, // 선택된 아이콘 색상
          unselectedItemColor: black, // 선택되지 않은 아이콘 색상
          selectedFontSize: 8,
          unselectedFontSize: 8, // 선택되지 않은 항목 label 숨기기
          type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
          backgroundColor: Colors.white.withOpacity(0.8),
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon/home.png')),
                label: "HOME"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon/user.png')),
                label: "TALK"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon/category.png')),
                label: "SETTINGS"),
          ],
        ),
      ),
      onWillPop: () {
        return Future(() => false);
      },
    );
  }
}
