import 'package:flutter/material.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/const/color_const.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(), isLeading: true),
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Now, you can buy ticket only website',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Text('https://woozu.co', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
