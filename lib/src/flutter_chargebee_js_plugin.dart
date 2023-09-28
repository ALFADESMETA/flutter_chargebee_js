@JS()
library chargebeejs;

import 'package:js/js.dart';

@JS('JSON.parse')
external Object jsonParse(String obj);

// This one is all I needed, don't forget to call allowInterop() on the executor!
@JS()
@staticInterop
class Promise {
  external factory Promise(
    void Function(Promise? Function(Object?) resolve,
            Promise? Function(Object?) reject)
        executor,
  );
}

@JS("Chargebee")
class FlutterChargebeeJSPlugin {
  external static init(ChargebeeOptions options);
  external static ChargebeeInstance getInstance();
}

/// Provides further customization for initializing the [Chargebee].
@JS()
@anonymous
class ChargebeeOptions {
  external String get site;

  external set site(String v);

  external String get publishableKey;

  external set publishableKey(String v);

  external String? get domain;

  external set domain(String? v);

  external factory ChargebeeOptions({
    String site,
    String publishableKey,
    String? domain,
  });
}

@JS()
@anonymous
class ChargebeeInstance {
  external openCheckout(ChargebeeOpenCheckoutOptions options);
  external setPortalSession(Function callback);
  external ChargebeePortal createChargebeePortal();
}

@JS()
@anonymous
class ChargebeePortal {
  external open(ChargebeePortalOpenOptions options);
}

@JS()
@anonymous
class ChargebeePortalOpenOptions {
  external Function get close;

  external set close(Function v);

  external factory ChargebeePortalOpenOptions({
    Function close,
  });
}

@JS()
@anonymous
class ChargebeeOpenCheckoutOptions {
  external Function get hostedPage;

  external set hostedPage(Function v);

  external factory ChargebeeOpenCheckoutOptions({
    Function hostedPage,
  });
}

// @JS()
// @anonymous
// class User {
//   external setCountry(String? country);

//   external setCustomUserAttribute(String key, dynamic value, bool? merge);
// }
