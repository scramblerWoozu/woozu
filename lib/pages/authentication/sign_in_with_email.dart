import 'package:flutter/material.dart';
import 'package:woozu/components/authentication/text_area.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/pages/authentication/sign_up.dart';
import 'package:woozu/repository/auth_repository.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<SignInWithEmail> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  String email ='';
  String password = '';

  
  @override
  void initState() {
    super.initState();
    // myController에 리스너 추가
    _emailController.addListener(setEmail);
    _passwordController.addListener(setPassword);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void setEmail() {
    setState(() {
      email = _emailController.text;
    });
  }

  void setPassword() {
    setState(() {
      password = _passwordController.text;
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
       appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(color: black,),
        ),
      body: SafeArea(
        child: Padding(
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

class SignInButton extends StatefulWidget {
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
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        AuthRepository().signInWithEmail(context, widget.email, widget.password);
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
