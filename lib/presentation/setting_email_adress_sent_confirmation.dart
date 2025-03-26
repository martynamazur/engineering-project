import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ootd/navigation/app_router.dart';
@RoutePage()
class EmailAddressSentConfirmationScreen extends StatelessWidget {
  const EmailAddressSentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle),
          Text("Click the link in the email to verify your new email address. If you don’t see the email, check your spam folder."),
          OutlinedButton(onPressed: (){
            context.router.popUntil((route) => route.settings.name == SettingsRoute.name);
          }, child: Text('Next'))
        ],
      )
      );
  }
}
