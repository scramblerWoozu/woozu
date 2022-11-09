import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VoiceChatArea extends StatefulWidget {
  const VoiceChatArea({
    Key? key,
  }) : super(key: key);

  @override
  State<VoiceChatArea> createState() => _VoiceChatAreaState();
}

class _VoiceChatAreaState extends State<VoiceChatArea> {
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
    return InAppWebView(
      key: webViewKey,
      initialFile: 'assets/html/index.html',
      initialOptions: options,
      onWebViewCreated: (controller) async {
        webViewController = controller;
      },
      onLoadStop: (controller, url) async {
        if (!Platform.isAndroid ||
            await AndroidWebViewFeature.isFeatureSupported(
                AndroidWebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
          // wait until the page is loaded, and then create the Web Message Channel
          var webMessageChannel =
              await webViewController!.createWebMessageChannel();

          var port2 = webMessageChannel!.port2;

          // await webViewController!.postWebMessage(
          //     message: WebMessage(data: chatInfo.roomId, ports: [port2]),
          //     targetOrigin: Uri.parse("*"));
        }
      },
      androidOnPermissionRequest: (controller, origin, resources) async {
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      },
      onLoadError: (controller, url, code, message) {},
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
    );
  }
}
