import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:woozu/const/color_const.dart';
import 'package:woozu/main.dart';
import 'package:woozu/model/user_model.dart';

class ReservePage extends StatefulWidget {
  const ReservePage(
      {Key? key, required this.partnerData, required this.userData})
      : super(key: key);

  final Map<String, dynamic> partnerData;
  final UserModel userData;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: true,
      supportZoom: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          onPressed: () {
            // navigate to homepage
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false,
            );
          },
          iconSize: 17.0,
          icon: Icon(Icons.arrow_back_ios),
          color: black,
        ),
      ),
      body: SafeArea(
        child: InAppWebView(
          key: webViewKey,
          initialFile: 'assets/html/calendar.html',
          // initialUrlRequest:
          //     URLRequest(url: Uri.parse('https://calendly.com/woozu/10min')),
          initialOptions: options,
          onWebViewCreated: (controller) async {
            webViewController = controller;
            controller.addJavaScriptHandler(
                handlerName: 'lodingComplete',
                callback: (args) {
                  return {
                    'calendar': widget.partnerData['calendly'],
                    'userName': widget.userData.userName.toString(),
                    'userEmail': widget.userData.email.toString(),
                  };
                });
          },

          onLoadStop: (controller, url) async {},
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onLoadError: (controller, url, code, message) {},
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage);
          },
        ),
      ),
    );
  }
}
