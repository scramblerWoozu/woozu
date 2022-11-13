import 'package:flutter/material.dart';
import 'package:woozu/components/chat_page/voice_chat_area.dart';

import 'package:woozu/const/color_const.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Woozu'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/profile_img/kimtaewan.png',
                    ),
                    radius: 70,
                  ),
                ],
              ),
              SizedBox(child: VoiceChatArea(), height: 0, width: 0),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/profile_img/alice.png',
                    ),
                    radius: 70,
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: size.width * 0.95,
                    height: 40,
                    decoration: BoxDecoration(
                        color: warning,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Leave now',
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
