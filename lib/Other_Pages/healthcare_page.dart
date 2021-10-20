import 'package:bsafe24x7/Util/Constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';


class HealthCarePage extends StatefulWidget {
  const HealthCarePage({Key? key}) : super(key: key);

  @override
  _HealthCarePageState createState() => _HealthCarePageState();
}


class _HealthCarePageState extends State<HealthCarePage> {

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return const RadialGradient(
              center: Alignment.topLeft,
              radius: 1.0,
              colors: <Color>[Color.fromARGB(255, 255, 96, 125), Colors.black38],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            Util.APP_NAME,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: 'https://www.womenshealthmag.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}

