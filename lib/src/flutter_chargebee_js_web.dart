import 'package:flutter_chargebee_js/src/flutter_chargbee_instance.dart';
import 'package:flutter_chargebee_js/src/flutter_chargebee_js_base.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'flutter_chargebee_js_plugin.dart';

class FlutterChargebeeJSImpl extends BaseFlutterChargebeeJS {
  @override
  void init({
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

  @override
  FlutterChargebeeInstance getInstance() {
    return FlutterChargebeeInstance(FlutterChargebeeJSPlugin.getInstance());
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
