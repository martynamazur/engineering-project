import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/add_clothes.dart';
import 'package:auto_route/auto_route.dart';
@RoutePage()
class RegistrationSuccessfulScreen extends StatelessWidget {
  const RegistrationSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
              const SizedBox(height: 24),
              const Text(
                'Registration Successful!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your account has been successfully created. '
                    'Please check your email to confirm your account before logging in.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceAll([LoginRoute()]);
                },
                child: const Text('Go to Login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
