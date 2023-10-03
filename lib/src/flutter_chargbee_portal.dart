import 'flutter_chargbee_portal_stub.dart'
    if (dart.library.io) 'flutter_chargbee_portal_mobile.dart'
    if (dart.library.html) 'flutter_chargbee_portal_web.dart';

class FlutterChargebeePortal {
  final FlutterChargebeePortalImpl _impl;

  FlutterChargebeePortal(dynamic chargebeePortal)
      : _impl = FlutterChargebeePortalImpl(chargebeePortal: chargebeePortal);

  void openPortal() {
    _impl.openPortal();
  }
}
