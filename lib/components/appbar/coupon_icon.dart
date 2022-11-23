import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/provider/coupon_service.dart';
import 'package:woozu/provider/user_service.dart';

class CouponIcon extends StatelessWidget {
  const CouponIcon({
    Key? key,
    required this.coupon,
  }) : super(key: key);

  final int coupon;

  @override
  Widget build(BuildContext context) {
    String email = context.watch<UserService>().user.email;
    final Stream<QuerySnapshot> usersStream =
        couponRef.where('email', isEqualTo: email).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          int coupon = 0;
          if (snapshot.data!.docs.isNotEmpty) {
            print('a');
            for (var element in snapshot.data!.docs) {
              Map<String, dynamic> couponData =
                  element.data() as Map<String, dynamic>;
              int num = couponData['num'];
              coupon += num;
              context.watch<CouponService>().setCouponState(coupon);
            }
          } else {
            print('b');
            context.watch<CouponService>().setCouponState(0);
          }

          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                // 잔여 쿠폰 수
                //티켓 아이콘
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icon/coupon.png',
                        width: 28,
                        height: 29,
                        color: black,
                      ),
                    ),
                    Text(
                      'Ticket',
                      style: TextStyle(color: black, fontSize: 11),
                    )
                  ],
                ),
                Positioned(
                  left: 13,
                  top: 3,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: black),
                      color: white,
                    ),
                    child: Center(
                      child: Text(
                        coupon.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
