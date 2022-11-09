import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({Key? key, required this.partnerData}) : super(key: key);

  final Map<String, dynamic> partnerData;

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
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
      body: SafeArea(
        child: InAppWebView(
          key: webViewKey,
          initialFile: 'assets/html/calendar.html',
          initialOptions: options,
          onWebViewCreated: (controller) async {
            webViewController = controller;

            controller.addJavaScriptHandler(
                handlerName: 'lodingComplete',
                callback: (args) {
                  return {
                    'calendar': widget.partnerData['calendly'],
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
