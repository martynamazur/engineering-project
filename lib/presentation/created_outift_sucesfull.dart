import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ootd/extensions/localization_extension.dart';
import '../navigation/app_router.dart';

@RoutePage()
class CreatedOutfitSuccessfulScreen extends StatelessWidget {
  const CreatedOutfitSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animations/check_success.json', repeat: false, width: 250, height: 250),
              Text(context.loc.savedOutfitMessage, style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              const SizedBox(height:16.0),
              OutlinedButton(
                  onPressed: () => context.router.popUntilRouteWithName(ChooseTemplateRoute.name),
                  child: Text(context.loc.createAnother)),
              const SizedBox(height: 8.0),
              OutlinedButton(
                  onPressed: () => context.router.pushAndPopUntil(
                      CreatedOutfitsRoute(),
                    predicate: (route) => false
                  ),
                  child: Text(context.loc.redirectToOutfitGalleryMessage))
            ],
          ),
        ),
      )),
    );
  }
}
