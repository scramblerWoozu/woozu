import 'package:flutter/material.dart';
import 'package:woozu/components/authentication/text_area.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/authentication/sign_up.dart';
import 'package:woozu/repository/auth_repository.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 48),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail'),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: TextArea(
                          controller: _emailController,
                          icon: '',
                          isObscure: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Password'),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: TextArea(
                          controller: _passwordController,
                          icon: 'icon',
                          isObscure: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SignInButton(
                    context: context,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmailSignUp()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Email Sign Up',
                          style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.context,
    required this.email,
    required this.password,
  }) : super(key: key);

  final BuildContext context;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        AuthRepository().signInWithEmail(context, email, password);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: selectedIconColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'Sign In',
            style: TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
