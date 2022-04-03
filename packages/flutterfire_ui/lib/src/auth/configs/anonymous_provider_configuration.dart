import 'package:flutter/foundation.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/src/auth/auth_flow.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flows/anonymous_flow.dart';

class AnonymousProviderConfiguration extends ProviderConfiguration {
  @override
  AuthFlow createFlow(FirebaseAuth? auth, AuthAction? action) {
    return AnonymousFlow(
      auth: auth,
      action: action,
    );
  }

  @override
  bool isSupportedPlatform(TargetPlatform platform) {
    return true;
  }

  @override
  String get providerId => 'anonymous';
}
