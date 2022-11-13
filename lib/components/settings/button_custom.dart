import 'package:flutter/material.dart';
import 'package:woozu/const/color_const.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: boxBorder,
          width: 1,
        ))),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
