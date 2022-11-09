import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:woozu/components/user_card/user_card.dart';
import 'package:woozu/model/partner_data.dart';

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Partner',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.4,
                  mainAxisSpacing: 24, //수평 Padding
                  crossAxisSpacing: 24, //수직 Padding
                ),
                itemCount: partnerInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> partner = partnerInfo[index];
                  return UserCard(partner: partner);
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
