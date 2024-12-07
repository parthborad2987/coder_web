import 'dart:io'; // For checking the platform
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key, required this.controller, required this.url});

  final WebViewController controller;
  final String url;

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize WebView for Android and iOS
    if (Platform.isAndroid) {
      widget.controller
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url))
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..addJavaScriptChannel("SnackBar", onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        });
    }
  }

  // This function launches the URL if not on Android/iOS
  Future<void> _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use WebView for Android/iOS, url_launcher for others
    if (kIsWeb || (!Platform.isAndroid)) {
      // Use url_launcher on web or other platforms
      _launchURL();
      return Scaffold(
        body: Center(
          child: Text('Opening in browser...'),
        ),
      );
    } else {
      // Use WebView on Android and iOS
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: widget.controller),
              if (loadingPercentage < 100)
                LinearProgressIndicator(
                  value: loadingPercentage / 100.0,
                  color: const Color.fromRGBO(239, 130, 130, 1),
                ),
            ],
          ),
        ),
      );
    }
  }
}
