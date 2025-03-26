import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ootd/presentation/styles/password_validator.dart';
import '../domain/state_management/user_provider.dart';

@RoutePage()
class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends ConsumerState<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _checkbox = false;
  bool _obscureText = true;
  bool _passwordIconVisibility = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // Each time the page rebuild, variables resets too
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.of(context).pop();
            context.router.maybePop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Create Account', style: headlineMedium),
                  const Text('Fill your information below'),
                  const SizedBox(height: 32.0),
                  _inputName(),
                  const SizedBox(height: 24.0),
                  _inputEmail(),
                  const SizedBox(height: 24.0),
                  _inputPassword(),
                  const SizedBox(height: 24.0),
                  _checkboxTermsConditions(),
                  const SizedBox(height: 24.0),
                  OutlinedButton(
                    onPressed: () async {
                      _signInValidator();
                    },
                    child: const Text(
                      'Sign up',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _inputName(){
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField _inputEmail(){
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          loginFailedMessage();
          return 'Email cannot be empty';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(Icons.email, color: Colors.grey),
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField _inputPassword(){
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscureText,
      validator: (value){
        if(value!.isEmpty){
          loginFailedMessage();
          return 'Password cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordIconVisibility ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            _passwordIconVisibility= !_passwordIconVisibility;
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(),
      ),
    );
  }

  Row _checkboxTermsConditions(){
    return Row(
      children: [
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: Checkbox(
            value: _checkbox,
            onChanged: (newValue) {
              setState(() {
                _checkbox = newValue!;
              });
            },
          ),
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            // redirect to the website
          },
          child: const Text.rich(
            TextSpan(
              text: 'Agree with ',
              children: [
                TextSpan(
                  text: 'Terms & Condition',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _signInValidator() async{
    if(_formKey.currentState?.validate() ?? false){
      try {
        await ref.read(userRepositoryProvider).signUp(
          _passwordController.text,
          _emailController.text,
          _nameController.text,
        );

        if (context.mounted)  context.router.push(RegistrationSuccessfulRoute());
      } catch (e) {
        showEmailAlreadyExistsMessage();
      }
    }
  }

  void loginFailedMessage() {
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

  void showEmailAlreadyExistsMessage() {
    _emailController.clear();
    _passwordController.clear();
    Flushbar(
      title: 'Sign Up Failed',
      message:
          'An account with this email already exists. Please use a different email or log in.',
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
