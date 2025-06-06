import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/main.dart';
import 'package:ootd/presentation/login.dart';
import 'package:ootd/presentation/styles/password_input.dart';
import 'package:ootd/utils/password_validator.dart';

import '../domain/state_management/user_provider.dart';
import '../model/result.dart';

@RoutePage()
class SettingChangePasswordScreen extends ConsumerStatefulWidget {
  const SettingChangePasswordScreen({super.key});

  @override
  ConsumerState createState() => _SettingChangePasswordState();
}

class _SettingChangePasswordState extends ConsumerState<SettingChangePasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _passwordValidator = PasswordValidator();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> passwordCreationRules = [
      context.loc.passwordRuleMinLength,
      context.loc.passwordRuleUppercase,
      context.loc.passwordRuleLowercase,
      context.loc.passwordRuleSpecialChar,
    ];


    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              spacing: 8,
              children: [
                Text(context.loc.enterOldAndNewPassword),
                Text(context.loc.passwordRequirements),
                ...passwordCreationRules.map((rule) => Row(
                  children: [
                    const Icon(Icons.check, color: Colors.green, size: 20),
                    Expanded(child: Text(rule)),
                  ],
                )).toList(),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16,
                    children: [
                      PasswordInput(passwordController: _oldPasswordController, passwordValidator: _passwordValidator),
                      PasswordInput(passwordController: _newPasswordController, passwordValidator: _passwordValidator)
                    ],)),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => _submitResetRequest(),
                      child: Text(context.loc.change)),
                )
                    ],
                  ),
          )),
    );
  }

  Future<void> _submitResetRequest() async{
    final messenger = ScaffoldMessenger.of(context);
    final email = supabase.auth.currentUser!.email;
    if(_formKey.currentState?.validate() ?? false){
      final password = _newPasswordController.text.trim();
      final result = await ref.read(userRepositoryProvider).resetPassword(email!);

      if (result.success) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.loc.passwordResetEmailSent)),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(content: Text(result.errorMessage ?? context.loc.error)),
        );
      }
    }else{
      messenger.showSnackBar(SnackBar(content: Text( context.loc.error)),
      );
    }
  }
}
