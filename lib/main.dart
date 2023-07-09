import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BASSER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BASSER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
              child: WebView(
                initialUrl: 'https://www.bcommunity-basser.com',
                javascriptMode: JavascriptMode.unrestricted,
                userAgent: "random",
                onPageStarted: (start) {  // ページ読み込み開始時の処理を追加
                  setState(() {
                    _isLoading = true;  // ページ読み込み開始時にフラグをtrueに設定
                  });
                },
                onPageFinished: (finish) {
                  setState(() {
                    _isLoading = false;
                  });
                },
              )
          ),
          _isLoading ? SpinKitRotatingCircle(color: Colors.black.withOpacity(0.5)) : Container(),
        ],
      ),
    );
  }
}
