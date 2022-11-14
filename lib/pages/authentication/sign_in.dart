import 'package:flutter/material.dart';
import 'package:woozu/components/authentication/email_sign_in_button.dart';
import 'package:woozu/components/authentication/google_sign_in.dart';
import 'package:woozu/const/color_const.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background_img/background.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Woozu',
                style: TextStyle(
                    color: white, fontSize: 45, fontWeight: FontWeight.w900),
              ),
              Spacer(),
              GoogleSignIn(),
              SizedBox(height: 16),
              EmailSignInButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      )),
    );
  }
}



