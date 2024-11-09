import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:ootd/presentation/styles/input_style.dart';
import 'package:ootd/presentation/styles/timer_button.dart';

import '../domain/state_management/user_provider.dart';


import 'package:auto_route/annotations.dart';
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reset Password', style: headlineMedium),
                Text(
                    'Enter the email address you used when you joined and we\'ll send you instructions to reset your password.'),
                SizedBox(height: 32.0),
                TextFormField(
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
                ),
                SizedBox(height: 32.0),
                TimerButton(
                  text: 'Send',
                  cooldownDuration: Duration(seconds: 30),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      ref.read(userRepositoryProvider).resetPassword(_emailController.text);
                      confirmationMessage(context);
                    }

                  },
                ),
                SizedBox(height: 32.0),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirmationMessage(BuildContext context) {
    Flushbar(
      title: 'Success',
      message: "If registered, you'll receive an email shortly with password reset instructions. Please check your inbox and spam folder.",
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.lightGreen,
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);
  }
}
