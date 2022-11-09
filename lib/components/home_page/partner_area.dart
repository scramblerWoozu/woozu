import 'package:flutter/material.dart';
import 'package:woozu/components/user_card/user_card.dart';
import 'package:woozu/model/partner_data.dart';

class PartnerArea extends StatelessWidget {
  const PartnerArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> partnerInfo = user;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Talk With peer-tutor',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 24),
          GridView.builder(
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
        ],
      ),
    );
  }
}
