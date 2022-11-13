import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:woozu/components/appbar/main_appbar.dart';
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
    print(widget.userData.email);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
        isLeading: true,
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
