import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/model/user_model.dart';
import 'package:woozu/pages/reserve_page.dart';
import 'package:woozu/provider/user_service.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    Key? key,
    required this.partner,
  }) : super(key: key);

  final Map<String, dynamic> partner;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    UserModel user = context.watch<UserService>().user;
    print(user.email);
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
        isLeading: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.35,
                  child: CachedNetworkImage(
                    imageUrl: partner['profileImg'],
                    imageBuilder: ((context, imageProvider) => Container(
                          width: double.infinity,
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitWidth)),
                        )),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.0,
                        color: primary,
                      ), // you can add pre loader iamge as well to show loading.
                    ),
                  ),
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
                                partner['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: size.width,
                                  child: Row(
                                    children: [
                                      //Name
                                      Text(
                                        partner['partnerName'],
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
                                          child: Text(partner['job'],
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
                                            partner['interest'],
                                            style: TextStyle(
                                                fontSize: 12, color: black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                  child: Text(partner['introduction']),
                                ),
                              ),

                              SizedBox(height: 16),
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
                            builder: (context) => ReservePage(
                                partnerData: partner, userData: user)));
                  },
                  child: Container(
                    width: size.width * 0.98,
                    height: 40,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Reserve',
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
