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
                  "id": "code",
                  "type": "checkout_new",
                  "url":
                      "https://site.chargebee.com/pages/v4/code/?signature=signature",
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
          TextButton(
            child: const Text('Set Portal Session'),
            onPressed: () async {
              var session = () async {
                var sampleResponse = {
                  "id": "portal_19AJqPTr7Sa7N7SmL",
                  "token": "urDwWEl5DpHXZ9Y2ALVUxPtCcudcdfRHRW",
                  "access_url":
                      "https://carvcom.chargebee.com/portal/v2/authenticate?token=urDwWEl5DpHXZ9Y2ALVUxPtCcudcdfRHRW",
                  "status": "created",
                  "created_at": 1695872118,
                  "expires_at": 1695875718,
                  "object": "portal_session",
                  "customer_id": "eWLgztxovBErx9tnWzMS",
                  "redirect_url": "https://app.carv.com",
                  "linked_customers": [
                    {
                      "object": "linked_customer",
                      "customer_id": "eWLgztxovBErx9tnWzMS",
                      "has_billing_address": false,
                      "has_payment_method": false,
                      "has_active_subscription": false
                    }
                  ]
                };
                await Future.delayed(Duration(seconds: 1));
                return sampleResponse;
              };

              instance?.setPortalSession(session);
            },
          ),
          TextButton(
            child: const Text('Open Self-Service Portal'),
            onPressed: () async {
              final portal = instance?.createChargebeePortal();
              portal?.openPortal();
            },
          ),
        ],
      ),
    );
  }
}
