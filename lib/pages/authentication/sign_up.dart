import 'package:flutter/material.dart';
import 'package:woozu/components/authentication/text_area.dart';
import 'package:woozu/components/common/show_snack_bar.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/repository/auth_repository.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({super.key});

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
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
                    Text('Name'),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: TextArea(
                          controller: _usernameController,
                          icon: 'icon',
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
                    SizedBox(height: 16),
                    Text('Confirm Password'),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: TextArea(
                          controller: _passwordConfirmController,
                          icon: 'icon',
                          isObscure: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SignUpButton(
                    context: context,
                    email: _emailController.text,
                    password: _passwordController.text,
                    passwordConfirm: _passwordConfirmController.text,
                    userName: _usernameController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.context,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.userName,
  }) : super(key: key);

  final BuildContext context;
  final String email;
  final String password;
  final String passwordConfirm;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        signUp(context, email, password, passwordConfirm, userName);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: black, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

void signUp(context, email, password, passwordConfirm, userName) {
  bool isValidate = validateTextArea(context, email, password, passwordConfirm);
  if (isValidate == true) {
    AuthRepository().singUpWithEmail(context, email, password, userName);
  }
}

//text field validate
bool validateTextArea(context, email, password, passwordConfirm) {
  if (password != passwordConfirm) {
    showSnackBar(context, 'password and confirm password is not equl');
    return false;
  } else if (email == '') {
    showSnackBar(context, 'Input Email address');
    return false;
  } else if (password == '' || passwordConfirm == '') {
    showSnackBar(context, 'Input password or confrim password');
    return false;
  } else {
    return true;
  }
}
