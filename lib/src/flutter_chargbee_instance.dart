import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';

import 'flutter_chargbee_instance_stub.dart'
    if (dart.library.io) 'flutter_chargbee_instance_mobile.dart'
    if (dart.library.html) 'flutter_chargbee_instance_web.dart';

class FlutterChargebeeInstance {
  final FlutterChargebeeInstanceImpl _impl;

  FlutterChargebeeInstance(dynamic chargebeeInstance)
      : _impl =
            FlutterChargebeeInstanceImpl(chargebeeInstance: chargebeeInstance);

  void openCheckout(
    Future<Map<String, dynamic>> Function() hostedPage, {
    Function(String)? onSuccess,
    Function()? onClose,
    Function(dynamic)? onError,
  }) {
    _impl.openCheckout(
      hostedPage,
      onSuccess: onSuccess,
      onClose: onClose,
      onError: onError,
    );
  }

  void setPortalSession(Future<Map<String, dynamic>> Function() portalSession) {
    _impl.setPortalSession(portalSession);
  }

  FlutterChargebeePortal createChargebeePortal() {
    return _impl.createChargebeePortal();
  }
}