import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woozu/components/settings/button_custom.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/model/user_model.dart';
import 'package:woozu/pages/settings/about_woozu.dart';
import 'package:woozu/pages/settings/privacy_police.dart';
import 'package:woozu/pages/settings/profile_page.dart';
import 'package:woozu/provider/user_service.dart';
import 'package:woozu/repository/auth_repository.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserService>().user;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.2,
                child: Center(
                  child: Text(
                    'Hi, ' + user.userName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: SettingsButton(title: 'Profile')),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );
                },
                child: SettingsButton(title: 'About Woozu & Contact Us'),
              ),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicy(),
                    ),
                  );
                },
                child: SettingsButton(title: 'Privacy policy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
