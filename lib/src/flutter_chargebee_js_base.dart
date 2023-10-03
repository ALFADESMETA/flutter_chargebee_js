import 'package:flutter_chargebee_js/src/flutter_chargbee_instance.dart';

abstract class BaseFlutterChargebeeJS {
  void init({
    required String site,
    required String publishableKey,
    String? domain,
  });

  FlutterChargebeeInstance getInstance();
}
