import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ootd/l10n/app_localizations.dart';
import 'package:ootd/navigation/app_router.dart';
@RoutePage()
class EmailAddressSentConfirmationScreen extends StatelessWidget {
  const EmailAddressSentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle),
            Text(AppLocalizations.of(context)!.confirmationEmailDescription),
            OutlinedButton(onPressed: (){
              context.router.popUntil((route) => route.settings.name == SettingsRoute.name);
            }, child: Text(AppLocalizations.of(context)!.next))
          ],
        ),
      )
      );
  }
}
