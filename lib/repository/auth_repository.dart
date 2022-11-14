import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:woozu/components/common/show_snack_bar.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/main.dart';
import 'package:woozu/pages/authentication/sign_in.dart';

//User 관련된 Api 통신  모음

class AuthRepository {
  //google sign in
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    //set user information in firebase
    if (authResult.additionalUserInfo!.isNewUser == true) {
      userRef.doc(authResult.user!.uid + 'u').set({
        "uid": authResult.user!.uid,
        "isOnboarding": false,
        'userName': authResult.additionalUserInfo!.profile!['name'],
        'email': authResult.user!.email,
        'isFirst': true,
        'interest': 'not setting',
        'country': authResult.additionalUserInfo!.profile!['locale'],
        'introduction': 'not setting',
        'coupon': 0
      });
    }

    // navigate to homepage
    if (authResult != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyHomePage()),
        (route) => false,
      );
    }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Email 회원가입 (Firebase)
  void singUpWithEmail(context, email, password, userName) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((credential) async {
        //emailcerification 메일 발송
        await credential.user!.sendEmailVerification();
        //성공여부 확인
        showSnackBar(context, 'verificate eamil address');

        //가장 기본적인 user collection 생성 (email verificate 전)
        userRef.doc(credential.user!.uid + 'u').set({
          "uid": credential.user!.uid,
          "isOnboarding": false,
          'userName': userName,
          'email': email,
          'isFirst': true,
          'interest': 'not setting',
          'country': 'not setting',
          'introduction': 'not setting',
          'coupon': 0
        });
        //logout why? email verification 을위해서
        SignOut(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'wrong password');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'email adress is already exist');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      }
    }
  }

  void signInWithEmail(context, email, password) async {
    try {
      //firebase 회원가입 함 수실행
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) {
        if (credential.user!.emailVerified == true) {
          String currentUid = credential.user!.uid;
          //snack Bar 띄워주기
          showSnackBar(context, 'login success');
          // 초기 프로필 세팅 여부 확인하기 (firestore에 firstSet field 확인)
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (route) => false,
          );
        } else if (credential.user!.emailVerified == false) {
          //email verification 여부 환인 후 안되어있으면 이메일 재전송 및 로그아웃
          credential.user!.sendEmailVerification();
          FirebaseAuth.instance.signOut();
          showSnackBar(context,
              'E-mail is not verificated, Check your email and do verificate');
        }
        ;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'user not found');
        ;
      } else if (e.code == 'wrong-password') {
        print(e.code);
        showSnackBar(context, 'wrong password');
      }
    }
  }

  //google sign out
  void SignOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}
