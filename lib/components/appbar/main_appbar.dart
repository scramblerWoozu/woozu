import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/repository/auth_repository.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.appBar,
    required this.isLeading,
  }) : super(key: key);

  final AppBar appBar;
  final bool isLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: isLeading == true
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 17.0,
              icon: Icon(Icons.arrow_back_ios),
              color: black,
            )
          : SizedBox(),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              // 잔여 쿠폰 수
              //티켓 아이콘
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icon/ticket.png',
                      width: 28,
                      height: 29,
                      color: black,
                    ),
                  ),
                  Text(
                    'Ticket',
                    style: TextStyle(color: black, fontSize: 11),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            AuthRepository().SignOut(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/icon/user.png',
                  width: 25,
                  height: 25,
                  color: black,
                ),
              ),
              Text(
                'Logout',
                style: TextStyle(color: black, fontSize: 11),
              )
            ],
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(appBar.preferredSize.height * 0.8);
}
