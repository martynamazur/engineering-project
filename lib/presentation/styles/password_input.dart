import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/utils/password_validator.dart';

import 'input_style.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required TextEditingController passwordController,
    required PasswordValidator passwordValidator,
  }) : _passwordController = passwordController, _passwordValidator = passwordValidator;

  final TextEditingController _passwordController;
  final PasswordValidator _passwordValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.loc.emptyPassword;
          } else if (!_passwordValidator.validate(value)) {
            return context.loc.loginFailedMessage;
          }
          return null;
        },
        decoration: passwordInputDecoration);
  }
}