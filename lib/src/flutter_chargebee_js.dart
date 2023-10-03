import 'package:flutter_chargebee_js/src/flutter_chargbee_instance.dart';

import 'flutter_chargebee_js_stub.dart'
    if (dart.library.io) 'flutter_chargebee_js_mobile.dart'
    if (dart.library.html) 'flutter_chargebee_js_web.dart';

class FlutterChargebeeJS {
  final FlutterChargebeeJSImpl _impl;

  FlutterChargebeeJS() : _impl = FlutterChargebeeJSImpl();

  void init({
    required String site,
    required String publishableKey,
    String? domain,
  }) {
    _impl.init(site: site, publishableKey: publishableKey, domain: domain);
  }

  FlutterChargebeeInstance getInstance() {
    return _impl.getInstance();
  }
}
