import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/components/user_card/user_card.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';


class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {


    final Stream<QuerySnapshot> partnerStream = partnerRef.snapshots();
    return Scaffold(
      backgroundColor: white,
      appBar: MainAppBar(
        appBar: AppBar(),
        isLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: partnerStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: const CircularProgressIndicator(color: Colors.amber));
          } else {
            List<Map<String, dynamic>> partnerInfo = [];
            snapshot.data!.docs.forEach((element) {
              partnerInfo.add(element.data() as Map<String, dynamic>);
            });
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Text(
                        'Partner' + '(' + partnerInfo.length.toString() + ')',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.5,
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
          }
        },
      ),
    );
  }
}
