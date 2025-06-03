import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:auto_route/auto_route.dart';
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


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(context.loc.createAccountHeader, style: headlineMedium),
                Text(context.loc.fillInformationMessage),
                const SizedBox(height: 32.0),
                _buildInputName(),
                const SizedBox(height: 24.0),
                _buildInputEmail(),
                const SizedBox(height: 24.0),
                _buildInputPassword(),
                const SizedBox(height: 24.0),
                _buildCheckboxTermsConditions(),
                const SizedBox(height: 24.0),
                OutlinedButton(
                  onPressed: () async {
                    _signInValidator();
                  },
                  child: Text(
                    context.loc.signUp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildInputName(){
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: context.loc.nameLabel,
        border: const OutlineInputBorder(),
      ),
    );
  }

  TextFormField _buildInputEmail(){
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          showLoginFailedMessage();
          return 'Email cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.loc.emailLabel,
        suffixIcon: const Icon(Icons.email, color: Colors.grey),
        border: const OutlineInputBorder(),
      ),
    );
  }

  TextFormField _buildInputPassword(){
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscureText,
      validator: (value){
        if(value!.isEmpty){
          showLoginFailedMessage();
          return 'Password cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.loc.passwordLabel,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            //_passwordIconVisibility= !_passwordIconVisibility;
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Row _buildCheckboxTermsConditions(){
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
          child: Text.rich(
            TextSpan(
              text: context.loc.agreeWith,
              children: [
                TextSpan(
                  text: context.loc.termsAndConditions,
                  style: const TextStyle(
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

        if (!_checkbox) {
          Flushbar(
            title: 'Zgoda wymagana',
            message: 'Musisz zaakceptować regulamin, aby się zarejestrować.',
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.orangeAccent,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
          return;
        }

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

  void showLoginFailedMessage() {
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
