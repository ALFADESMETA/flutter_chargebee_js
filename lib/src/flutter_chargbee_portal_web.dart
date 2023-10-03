import 'dart:js_util';

import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';
import 'package:flutter_chargebee_js/src/flutter_chargebee_js_plugin.dart';

class FlutterChargebeePortalWeb implements FlutterChargebeePortal {
  final ChargebeePortal chargebeePortal;
  FlutterChargebeePortalWeb(this.chargebeePortal);

  void openPortal() {
    try {
      chargebeePortal.open(ChargebeePortalOpenOptions(
        close: allowInterop(() {
          print('Portal closed');
        }),
      ));
    } catch (err) {
      print(err);
    }
  }
}
