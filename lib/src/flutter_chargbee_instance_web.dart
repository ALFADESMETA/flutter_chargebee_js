import 'dart:js_util';

import 'package:flutter_chargebee_js/src/flutter_chargbee_instance_base.dart';
import 'package:flutter_chargebee_js/src/flutter_chargbee_portal.dart';
import 'package:flutter_chargebee_js/src/flutter_chargebee_js_plugin.dart';

class FlutterChargebeeInstanceImpl extends BaseFlutterChargebeeInstance {
  final ChargebeeInstance chargebeeInstance;
  FlutterChargebeeInstanceImpl({dynamic chargebeeInstance})
      : chargebeeInstance = chargebeeInstance;

  @override
  void openCheckout(
    Future<Map<String, dynamic>> Function() hostedPage, {
    Function(String)? onSuccess,
    Function()? onClose,
    Function(dynamic)? onError,
  }) {
    try {
      chargebeeInstance.openCheckout(
        ChargebeeOpenCheckoutOptions(
          hostedPage: allowInterop(() {
            return Promise(
              allowInterop(
                (resolve, reject) async {
                  try {
                    var result = await hostedPage();
                    resolve(jsify(result));
                  } catch (err) {
                    reject(err);
                  }
                },
              ),
            );
          }),
          success: onSuccess != null
              ? allowInterop((String hostedPageId) {
                  onSuccess(hostedPageId);
                })
              : null,
          close: onClose != null
              ? allowInterop(() {
                  onClose();
                })
              : null,
          error: onError != null
              ? allowInterop((dynamic error) {
                  onError(error);
                })
              : null,
        ),
      );
    } catch (err) {
      print(err);
      if (onError != null) {
        onError(err);
      }
    }
  }

  @override
  void setPortalSession(Future<Map<String, dynamic>> Function() portalSession) {
    try {
      chargebeeInstance.setPortalSession(
        allowInterop(() {
          return Promise(
            allowInterop(
              (resolve, reject) async {
                try {
                  var result = await portalSession();
                  resolve(jsify(result));
                } catch (err) {
                  reject(err);
                }
              },
            ),
          );
        }),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  FlutterChargebeePortal createChargebeePortal() {
    try {
      return FlutterChargebeePortal(chargebeeInstance.createChargebeePortal());
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}