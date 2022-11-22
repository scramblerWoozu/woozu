import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/model/user_model.dart';
import 'package:woozu/pages/detail_page/reserve_page.dart';
import 'package:woozu/provider/coupon_service.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.partner,
    required this.user,
    required this.size,
  }) : super(key: key);

  final Map<String, dynamic> partner;
  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    int coupon = context.watch<CouponService>().coupon;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: coupon != 0
            ? GestureDetector(
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
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Container(
                width: size.width * 0.98,
                height: 40,
                decoration: BoxDecoration(
                    color: secondary, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'You need to buy more coupon',
                    style: TextStyle(color: white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ),
    );
  }
}
