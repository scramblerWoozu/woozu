import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/components/authentication/text_area.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/const/db_const.dart';
import 'package:woozu/model/user_model.dart';
import 'package:woozu/pages/route_page.dart';
import 'package:woozu/provider/user_service.dart';
import 'package:woozu/repository/user_repository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _introductionController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _interestController.dispose();
    _introductionController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    UserModel user = context.watch<UserService>().user;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8 ,0),
          child: SingleChildScrollView(
            child: Container(
              height: size.height * 0.88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user.userName + "'s profile edit",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 16),
                        Text(user.email, style: TextStyle(fontSize: 15))
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Interest',
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      obscureText: false,
                      controller: _interestController,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          hintText: user.interest,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true),
                      keyboardType: TextInputType.text,
                      onChanged: (String text) {},
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'country',
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      obscureText: false,
                      controller: _countryController,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          hintText: user.country,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          isDense: true),
                      keyboardType: TextInputType.text,
                      onChanged: (String text) {},
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Introduction',
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    child: TextField(
                      obscureText: false,
                      controller: _introductionController,
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                          hintText: user.introduction,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          isDense: true),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (String text) {},
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (_interestController.text == '') {
                        _interestController.text = user.interest;
                      }

                      if (_introductionController.text == '') {
                        _introductionController.text = user.introduction;
                      }

                      if (_countryController.text == '') {
                        _countryController.text = user.country;
                      }

                      print(_interestController.text +
                          _introductionController.text +
                          _countryController.text);
                      UserRepository().updateUser(
                          context,
                          user.uid,
                          _interestController.text,
                          _countryController.text,
                          _introductionController.text);
                    },
                    child: Container(
                      width: size.width * 0.98,
                      height: 40,
                      decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Setting',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
