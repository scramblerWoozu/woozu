import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/reserve_page.dart';

class UserDetailPage extends StatelessWidget {
  UserDetailPage({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  userData['profileImg'],
                  width: double.infinity,
                  height: size.height * 0.35,
                  fit: BoxFit.cover,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //title
                              Text(
                                userData['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  //Name
                                  Text(
                                    userData['partnerName'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                  Spacer(),
                                  //job
                                  Container(
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(userData['job'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: black,
                                          )),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  //interest
                                  Container(
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        userData['interest'],
                                        style: TextStyle(
                                            fontSize: 12, color: black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              //introduction
                              Text(
                                'Self Introduction',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: boxBorder),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(userData['introduction']),
                                ),
                              ),

                              SizedBox(height: 16),
                              // Text(
                              //   'Pronunciation',
                              //   style: TextStyle(
                              //       fontSize: 14, fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //bottom button
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReservePage(partnerData: userData)));
                  },
                  child: Container(
                    width: size.width * 0.98,
                    height: 40,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Reserve',
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
            // backward arrow
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
