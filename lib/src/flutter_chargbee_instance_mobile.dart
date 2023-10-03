import 'package:flutter_chargebee_js/src/flutter_chargbee_instance.dart';
import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';

class FlutterChargebeeInstanceMobile implements FlutterChargebeeInstance {
  FlutterChargebeeInstanceMobile();

  void openCheckout(Future<Map<String, dynamic>> Function() hostedPage) {
    throw UnimplementedError();
  }

  void setPortalSession(Future<Map<String, dynamic>> Function() portalSession) {
    throw UnimplementedError();
  }

  FlutterChargebeePortal createChargebeePortal() {
    throw UnimplementedError();
  }
}
