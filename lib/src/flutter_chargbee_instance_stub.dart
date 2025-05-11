import 'package:flutter_chargebee_js/src/flutter_chargbee_instance_base.dart';
import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';

class FlutterChargebeeInstanceImpl extends BaseFlutterChargebeeInstance {
  FlutterChargebeeInstanceImpl({dynamic chargebeeInstance});

  @override
  void openCheckout(
    Future<Map<String, dynamic>> Function() hostedPage, {
    Function(String)? onSuccess,
    Function()? onClose,
    Function(dynamic)? onError,
  }) {
    throw UnimplementedError();
  }

  @override
  void setPortalSession(Future<Map<String, dynamic>> Function() portalSession) {
    throw UnimplementedError();
  }

  @override
  FlutterChargebeePortal createChargebeePortal() {
    throw UnimplementedError();
  }
}