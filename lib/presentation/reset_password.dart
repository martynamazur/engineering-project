import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:ootd/presentation/styles/input_style.dart';
import 'package:ootd/presentation/styles/timer_button.dart';

import '../domain/state_management/user_provider.dart';


@RoutePage()
class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends ConsumerState<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32.0),
                _buildInputEmail(),
                const SizedBox(height: 32.0),
                _buildTimerButton(context),
                const SizedBox(height: 32.0),
                OutlinedButton(
                  onPressed: () => context.router.maybePop(),
                  child: Text(context.loc.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.resetPasswordHeader, style: headlineMedium),
        const SizedBox(height: 8),
        const Text(
          'Enter the email address you used when you joined and we\'ll send you instructions to reset your password.',
        ),
      ],
    );
  }


  TimerButton _buildTimerButton(BuildContext context) {
    return TimerButton(
                text: 'Send',
                cooldownDuration: const Duration(seconds: 30),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    ref.read(userRepositoryProvider).resetPassword(_emailController.text);
                    _showConfirmationMessage(context);
                  }
                },
              );
  }

  TextFormField _buildInputEmail() {
    return TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: emailInputDecoration
              );
  }

  void _showConfirmationMessage(BuildContext context) {
    Flushbar(
      title: context.loc.success,
      message: "If registered, you'll receive an email shortly with password reset instructions. Please check your inbox and spam folder.",
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.lightGreen,
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);
  }
}
