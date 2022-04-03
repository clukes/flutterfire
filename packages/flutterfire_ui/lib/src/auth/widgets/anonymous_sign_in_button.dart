import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/i10n.dart';

import '../flows/anonymous_flow.dart';
import './internal/universal_button.dart';
import './internal/universal_page_route.dart';

class AnonymousSignInButton extends StatelessWidget {
  final FirebaseAuth? auth;

  const AnonymousSignInButton({
    Key? key,
    this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCupertino = CupertinoUserInterfaceLevel.maybeOf(context) != null;
    final l = FlutterFireUILocalizations.labelsOf(context);

    return UniversalButton(
      text: 'Anonymous', //l.anonymousSignInButtonLabel, TODO: Write label localisations
      icon: isCupertino ? CupertinoIcons.link : Icons.link,
      onPressed: () {
        final action =
        FlutterFireUIAction.ofType<AnonymousSignInAction>(context);
        if (action != null) {
          action.callback(context);
        } else {
          Navigator.of(context).push(
            createPageRoute(
              context: context,
              builder: (_) {
                return FlutterFireUIActions.inherit(
                  from: context,
                  child: EmailLinkSignInScreen(
                    auth: auth,
                    config: config,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
