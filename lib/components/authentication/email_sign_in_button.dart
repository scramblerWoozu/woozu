import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/authentication/sign_in_with_email.dart';

class EmailSignInButton extends StatelessWidget {
  const EmailSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInWithEmail()),
        );
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
              Icon(Icons.email),
              Spacer(),
              Text(
                'Login With Email',
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
