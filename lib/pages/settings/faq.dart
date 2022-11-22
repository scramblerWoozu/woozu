import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
import 'package:woozu/const/color_const.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: MainAppBar(
        appBar: AppBar(),
        isLeading: true,
      ),
      body: Column(
        children: [
          Accordion(
            maxOpenSections: 1,
            headerBackgroundColorOpened: Colors.black54,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                leftIcon: const Icon(Icons.calendar_month, color: Colors.white),
                headerBackgroundColor: Colors.black,
                headerBackgroundColorOpened: Colors.red,
                header:
                    Text('How can experience free trial', style: _headerStyle),
                content: Text(
                    'Now, You reservate free trial reservation in web-site\nhttps://woozu.co\nTry, It',
                    style: _contentStyle),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                isOpen: true,
                leftIcon: const Icon(Icons.payment, color: Colors.white),
                headerBackgroundColor: Colors.black,
                headerBackgroundColorOpened: backgroundPrimary,
                header: Text('How to purchase coupon', style: _headerStyle),
                content: Text(
                    'Now you can buy coupon only web-site\nhttps://woozu.co\nSoon, You can purchase coupon in application',
                    style: _contentStyle),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
