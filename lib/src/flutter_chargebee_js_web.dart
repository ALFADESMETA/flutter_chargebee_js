import 'dart:js_util';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'flutter_chargebee_js_plugin.dart';

class FlutterChargebeeJSWeb {
  FlutterChargebeeJSWeb._();

  static void init({
    required String site,
    required String publishableKey,
    String? domain,
  }) {
    try {
      FlutterChargebeeJSPlugin.init(ChargebeeOptions(
        site: site,
        publishableKey: publishableKey,
        domain: domain,
      ));
    } catch (err) {
      print(err);
    }
  }

  static FlutterChargebeeInstance getInstance() {
    return FlutterChargebeeInstance(FlutterChargebeeJSPlugin.getInstance());
  }
}

class FlutterChargebeeInstance {
  final ChargebeeInstance chargebeeInstance;
  FlutterChargebeeInstance(this.chargebeeInstance);

  void openCheckout(Future<Map<String, dynamic>> Function() hostedPage) {
    try {
      chargebeeInstance.openCheckout(
        ChargebeeOpenCheckoutOptions(
          hostedPage: allowInterop(() {
            return Promise(
              allowInterop(
                (resolve, reject) async {
                  try {
                    var result = await hostedPage();
                    resolve(jsify(result));
                  } catch (err) {
                    reject(err);
                  }
                },
              ),
            );
          }),
        ),
      );
    } catch (err) {
      print(err);
    }
  }
}

/// Implementation of the Braze Plugin for Web.
class FlutterChargebeeJSWebPlugin {
  // Consider using PlatformInterface
  static late FlutterChargebeeJSWebPlugin instance;

  static void registerWith(Registrar registrar) {
    /// Don't intend to use method channel for web, as this adds an overhead
    instance = FlutterChargebeeJSWebPlugin();

    // Sets the call from JavaScript handler
    // _jsOnEvent = allowInterop((dynamic event) {
    //   //Process JavaScript call here
    // });
  }
}
