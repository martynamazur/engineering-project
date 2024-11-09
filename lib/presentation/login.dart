import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/password_validator.dart';


import '../domain/state_management/user_provider.dart';
import 'styles/input_style.dart';


@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordValidator = PasswordValidator();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            _inputEmail(),
            _inputPassword(),
            _resetPassword(),
            _registration(),
            _signInButton()
          ]),
        ),
      ),
    );
  }

  TextFormField _inputEmail() {
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
        decoration: emailInputDecoration);
  }

  TextFormField _inputPassword() {
    return TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password cannot be empty';
          } else if (!_passwordValidator.validate(value)) {
            return 'Incorrect Email or Password';
          }
          return null;
        },
        decoration: passwordInputDecoration);
  }

  Widget _resetPassword() {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, '/resetPassword');
        //context.router.replace(const ClosetFolderOverviewRoute());
      },
      child: Text('Password reset'),
    );
  }

  Widget _registration(){
    return GestureDetector(
      onTap: () {
        context.router.push(RegistrationRoute());
        //Navigator.pushNamed(context, '/registration');
        //context.router.replace(const RegistrationRoute());
      },
      child: const Text.rich(
        TextSpan(
          text: 'Are you new here? ',
          children: [
            TextSpan(
              text: 'Create an account',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInButton(){
    return  ElevatedButton(
      onPressed: _signInValidator,
      child: Text('Sign in'),
    );
  }

  void _signInValidator() async{

    if (_formKey.currentState?.validate() == true) {
      final response = await ref.read(userRepositoryProvider).signIn(
          _emailController.text,
          _passwordController.text,
          context
      );

      if (response) {
        context.router.replace(const HomeRoute());
      } else {
        loginFailedMessage(context);
      }
    } else {
      loginFailedMessage(context);
    }
  }

  void loginFailedMessage(BuildContext context) {
    _emailController.clear();
    _passwordController.clear();
    Flushbar(
      title: 'Login failed',
      message: 'Invalid email or password',
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
