import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:woozu/components/user_card/user_card.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/model/partner_data.dart';

class PartnerArea extends StatelessWidget {
  const PartnerArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> partnerStream = partnerRef.snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: partnerStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: const CircularProgressIndicator(color: Color(0xFFFFF4CB)));
        } else {
          List<Map<String, dynamic>> partnerInfo = [];
          snapshot.data!.docs.forEach((element) {
            partnerInfo.add(element.data() as Map<String, dynamic>);
          });

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
                    childAspectRatio: 1 / 1.6,
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
      },
    );
  }
}
