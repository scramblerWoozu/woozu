import 'package:flutter/material.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/pages/route_page.dart';

//User 관련된 Api 통신  모음

class UserRepository {
  //google sign in
  void updateUser(
      BuildContext context, uid, interest, country, introduction) async {
    //set user information in firebase

    userRef.doc(uid + 'u').update({
      'interest': interest,
      'country': country,
      'introduction': introduction
    }).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoutePage(),
        ),
      );
    });
  }
}
