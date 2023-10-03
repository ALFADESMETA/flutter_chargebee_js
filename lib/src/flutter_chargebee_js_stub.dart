import 'package:flutter_chargebee_js/src/flutter_chargbee_instance.dart';
import 'package:flutter_chargebee_js/src/flutter_chargebee_js_base.dart';

class FlutterChargebeeJSImpl extends BaseFlutterChargebeeJS {
  @override
  void init({
    required String site,
    required String publishableKey,
    String? domain,
  }) {
    throw UnimplementedError();
  }

  @override
  FlutterChargebeeInstance getInstance() {
    throw UnimplementedError();
  }
}
