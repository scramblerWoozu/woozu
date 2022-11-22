import 'package:flutter/material.dart';

/// Bucket 담당
class CouponService extends ChangeNotifier {
  int coupon = 0;
  /// bucket 추가
  void setCouponState(state) {
    coupon = state;
  }
}
