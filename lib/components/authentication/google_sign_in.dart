import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/repository/auth_repository.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthRepository().signInWithGoogle(context);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              Image.asset('assets/icon/google.png', width: 20, height: 20),
              Spacer(),
              Text(
                'Login With Google',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Spacer(),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
