import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/background_img/logo.png',
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(height: 36),
          Text(
            'Loading ...',
            style: TextStyle(
                color: white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
