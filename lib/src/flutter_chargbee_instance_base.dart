import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';

abstract class BaseFlutterChargebeeInstance {
  void openCheckout(Future<Map<String, dynamic>> Function() hostedPage);

  void setPortalSession(Future<Map<String, dynamic>> Function() portalSession);

  FlutterChargebeePortal createChargebeePortal();
}
