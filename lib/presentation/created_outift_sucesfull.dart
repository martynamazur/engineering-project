import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ootd/presentation/outfit_overfiew.dart';

import '../navigation/app_router.dart';

@RoutePage()
class CreatedOutiftSucesfullScreen extends StatelessWidget {
  const CreatedOutiftSucesfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/check_success.json', repeat: false, width: 250, height: 250),
            Text('Outfit has been saved!', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
            SizedBox(height:16.0),
            OutlinedButton(
                onPressed: () {
                  context.router.popUntilRouteWithName(ChooseTemplateRoute.name);
                },
                child: Text('Create another')),
            SizedBox(height: 8.0),
            OutlinedButton(
                onPressed: () => context.router.pushAndPopUntil(
                    CreatedOutfitsRoute(),
                  predicate: (route) => false
                ),
                child: Text('Go to the outfit gallery '))
          ],
        ),
      )),
    );
  }
}
