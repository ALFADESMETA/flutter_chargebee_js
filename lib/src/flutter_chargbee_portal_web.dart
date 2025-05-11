import 'dart:js_util';

import 'package:flutter_chargebee_js/src/flutter_chargbee_portal_base.dart';
import 'package:flutter_chargebee_js/src/flutter_chargebee_js_plugin.dart';

class FlutterChargebeePortalImpl extends BaseFlutterChargebeePortal {
  final ChargebeePortal chargebeePortal;
  FlutterChargebeePortalImpl({dynamic chargebeePortal})
      : chargebeePortal = chargebeePortal;

  @override
  void openPortal({
    Function()? onClose,
  }) {
    try {
      chargebeePortal.open(ChargebeePortalOpenOptions(
        close: allowInterop(() {
          print('Portal closed');
          if (onClose != null) {
            onClose();
          }
        }),
      ));
    } catch (err) {
      print(err);
    }
  }
}