import 'package:flutter/material.dart';

import 'package:woozu/components/home_page/main_banner.dart';
import 'package:woozu/components/home_page/partner_area.dart';
import 'package:woozu/components/user_card/user_card.dart';
import 'package:woozu/model/partner_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> partnerInfo = user;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                'Hot Tutor',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              child: PageView(
                children: [
                  MainBanner1(size: size),
                  MainBanner2(size: size),
                ],
              ),
            ),
            PartnerArea(),
          ],
        ),
      ),
    );
  }
}
