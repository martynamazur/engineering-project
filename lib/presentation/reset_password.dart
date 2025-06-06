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
              spacing: 32.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildInputEmail(),
                _buildTimerButton(),

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
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.resetPasswordHeader, style: headlineMedium),
        Text(context.loc.resetPasswordInstruction),
      ],
    );
  }


  TimerButton _buildTimerButton() {
    return TimerButton(
                text: context.loc.send,
                cooldownDuration: const Duration(seconds: 30),
                onPressed: () async {
                  //TODO: dodac sprawdzenie czy sie powiodlo
                  if (_formKey.currentState?.validate() == true) {
                    await ref.read(userRepositoryProvider).resetPassword(_emailController.text);
                    _showConfirmationMessage();
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
                    return context.loc.emptyEmail;
                  } else if (!EmailValidator.validate(value)) {
                    return  context.loc.invalidEmail;
                  }
                  return null;
                },
                decoration: emailInputDecoration
              );
  }

  void _showConfirmationMessage() {
    Flushbar(
      title: context.loc.success,
      message: context.loc.resetPasswordConfirmationMessage,
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.lightGreen,
      flushbarPosition: FlushbarPosition.BOTTOM,
    ).show(context);
  }
}
