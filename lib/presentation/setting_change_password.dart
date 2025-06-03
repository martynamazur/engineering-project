import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/login.dart';
import 'package:ootd/presentation/styles/password_input.dart';
import 'package:ootd/presentation/password_validator.dart';

import '../domain/state_management/user_provider.dart';

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
      'Minimum of 6 characters',
      'At least one uppercase letter (A-Z)',
      'At least one lowercase letter (a-z)',
      'At least one special character (e.g., !, @, #, \$)'
    ];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text('Enter your old and then new password'),
                Text('Password Requirements'),
                ...passwordCreationRules.map((rule) => Row(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Expanded(child: Text(rule)),
                  ],
                )).toList(),
                Form(child:
                  Column(children: [
                    PasswordInput(passwordController: _oldPasswordController, passwordValidator: _passwordValidator),
                    PasswordInput(passwordController: _newPasswordController, passwordValidator: _passwordValidator)
                  ],)),
                TextButton(onPressed: (){

    },              child: Text('Change'))
                    ],
                  ),
          )),
    );
  }


}
