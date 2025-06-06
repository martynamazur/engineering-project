import 'package:flutter/material.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
@RoutePage()
class RegistrationSuccessfulScreen extends StatelessWidget {
  const RegistrationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green, size: 100
                ),
                const SizedBox(height: 24),
                Text(
                  context.loc.registrationSuccessful,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(context.loc.accountCreationConfirmationMessage,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => context.router.replaceAll([LoginRoute()]),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(context.loc.goToLogin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
