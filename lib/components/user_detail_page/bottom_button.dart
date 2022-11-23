import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/model/user_model.dart';
import 'package:woozu/pages/detail_page/reserve_page.dart';
import 'package:woozu/provider/coupon_service.dart';

class BottomButton extends StatefulWidget {
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
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CouponService>(builder: (context, couponService, child) {
      int coupon = couponService.getCouponState();

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
                                partnerData: widget.partner,
                                userData: widget.user)));
                  },
                  child: Container(
                    width: widget.size.width * 0.98,
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
                )
              : Container(
                  width: widget.size.width * 0.98,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'You need to buy more coupon',
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
