import 'package:flutter/material.dart';
import 'package:flutter_chargebee_js/flutter_chargebee_js.dart';

/// Set the FlutterChargebeeJS API Key and Base URL with Dart Environment Variables
/// Run Args: --dart-define=apiKey=1234567890 --dart-define=baseUrl=sdk.iad-02.FlutterChargebeeJS.com
void main() => runApp(MyApp());

const String _FlutterChargebeeJSSite = String.fromEnvironment('site');
const String _FlutterChargebeeJSPublishableKey =
    String.fromEnvironment('publishableKey');
const String _FlutterChargebeeJSDomain = String.fromEnvironment('domain');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChargebeeJS Plugin for Web',
      home: FlutterChargebeeJSWebExamplePage(),
    );
  }
}

class FlutterChargebeeJSWebExamplePage extends StatefulWidget {
  @override
  FlutterChargebeeJSWebExamplePageState createState() =>
      new FlutterChargebeeJSWebExamplePageState();
}

class FlutterChargebeeJSWebExamplePageState
    extends State<FlutterChargebeeJSWebExamplePage> {
  FlutterChargebeeInstance? instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChargebeeJS Web Example'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text('Initialize'),
            onPressed: () async {
              FlutterChargebeeJSWeb.init(
                site: _FlutterChargebeeJSSite,
                publishableKey: _FlutterChargebeeJSPublishableKey,
                domain: _FlutterChargebeeJSDomain.isNotEmpty
                    ? _FlutterChargebeeJSDomain
                    : null,
              );
            },
          ),
          TextButton(
            child: const Text('Get Instance'),
            onPressed: () async {
              instance = FlutterChargebeeJSWeb.getInstance();
            },
          ),
          TextButton(
            child: const Text('Open Checkout'),
            onPressed: () async {
              var hostedPage = () async {
                var sampleResponse = {
                  "id": "UTicu9m3sxphcdfcuuMs3vjv21iMwQb6ecuO",
                  "type": "checkout_new",
                  "url":
                      "https://carvcom.chargebee.com/pages/v4/UTicu9m3sxphcdfcuuMs3vjv21iMwQb6ecuO/?signature=7CGhPtb9qfD6K5Uk1HnVbNgZoK67yONv",
                  "state": "created",
                  "embed": false,
                  "created_at": 1695709985,
                  "expires_at": 1695720785,
                  "object": "hosted_page",
                  "updated_at": 1695709985,
                  "resource_version": 1695709985080
                };
                await Future.delayed(Duration(seconds: 1));
                return sampleResponse;
              };

              instance?.openCheckout(hostedPage);
            },
          ),
        ],
      ),
    );
  }
}
