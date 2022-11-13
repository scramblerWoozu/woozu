import 'package:flutter/material.dart';
import 'package:woozu/model/user_model.dart';

/// Bucket 담당
class UserService extends ChangeNotifier {
  UserModel user = UserModel.init();

  /// bucket 추가
  void setUserState(state) {
    user = state;
  }
}
