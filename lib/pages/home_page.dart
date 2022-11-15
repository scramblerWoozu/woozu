import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/components/home_page/main_banner.dart';
import 'package:woozu/components/home_page/partner_area.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/repository/main_youtube.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      appBar: MainAppBar(
        appBar: AppBar(),
        isLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(
                  'Hot Tutor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 8),
              YoutubeArea(size: size),
              PartnerArea(),
            ],
          ),
        ),
      ),
    );
  }
}

class YoutubeArea extends StatelessWidget {
  const YoutubeArea({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> popularMentorStream = popularMentorRef.snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: popularMentorStream ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: const CircularProgressIndicator(color: Color(0xFFFFF4CB)));
        } else {
          List<Map<String, dynamic>> youtubeData = [];
          snapshot.data!.docs.forEach((element) {
            youtubeData.add(element.data() as Map<String, dynamic>);
          });
    
          return Container(
            width: double.infinity,
            height: size.height * 0.3,
            child: PageView.builder(
              controller: PageController(initialPage: 0),
              itemCount: youtubeData.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> data = youtubeData[index];
                return MainBanner1(size: size, data : data);
              },
            ),
          );
        }
      }
    );
  }
}