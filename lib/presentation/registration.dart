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
  bool _isLoading = false;
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
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 24.0,
              children: [
                Text(context.loc.createAccountHeader, style: headlineMedium),
                Text(context.loc.fillInformationMessage),
                const SizedBox(height: 16.0),
                _buildInputName(),
                _buildInputEmail(),
                _buildInputPassword(),
                _buildCheckboxTermsConditions(),

                OutlinedButton(
                  onPressed: () async {
                    _submitRegistrationForm();
                  },
                  child: _isLoading
                      ? const SizedBox(
                      width: 16.0,
                      height: 16.0,
                      child: CircularProgressIndicator()
                  ) : Text(context.loc.signUp)
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
          return context.loc.emptyEmail;
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
          return context.loc.emptyPassword;
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

  Widget _buildCheckboxTermsConditions(){
    return FormField(
      initialValue: false,
      validator: (value){
        if(value != true){
          return context.loc.consentRequiredMessage;
        }
        return null;
      },
      builder: (field) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Checkbox(
                    value: field.value,
                    onChanged: (newValue) {
                      setState(() {
                        field.didChange(newValue);
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
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      }
      );

  }

  void _submitRegistrationForm() async{
    if (_isLoading) return;
    if(_formKey.currentState?.validate() ?? false){
      setState(() => _isLoading = true);
      final messenger = ScaffoldMessenger.of(context);

      final result = await ref.read(userRepositoryProvider).signUp(
        _passwordController.text,
        _emailController.text,
        _nameController.text,
      );

      setState(() => _isLoading = false);

      if(result.success){
        context.router.push(const RegistrationSuccessfulRoute());
      }else{
        messenger.showSnackBar(SnackBar(content: Text(result.errorMessage!)));
      }
    }
  }
  //TODO: Ujednolicic wiadomosci zwrotne i sie zastanwoic co chce uzyc scaffoldmess czy flushbaru
  void showLoginFailedMessage() {
    _emailController.clear();
    _passwordController.clear();
    Flushbar(
      title: context.loc.loginFailedTitle,
      message: context.loc.loginFailedMessage,
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void showEmailAlreadyExistsMessage() {
    _emailController.clear();
    _passwordController.clear();
    Flushbar(
      title: context.loc.signUpFailed,
      message:
          context.loc.accountExistsMessage,
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
