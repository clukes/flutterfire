import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfire_ui/auth.dart';

import '../auth_flow.dart';
import '../auth_state.dart';

class AnonymousFlow extends AuthFlow {
  AnonymousFlow({
    FirebaseAuth? auth,
    AuthAction? action,
  }) : super(
          auth: auth,
          action: action,
          initialState: const Uninitialized(),
        );

  @override
  Future<User?> signIn(AuthCredential? credential) async {
    final userCredential = await auth.signInAnonymously();
    return userCredential.user;
  }
}

class AnonymousSignInAction extends FlutterFireUIAction {
  final void Function(BuildContext context) callback;

  AnonymousSignInAction(this.callback);
}
