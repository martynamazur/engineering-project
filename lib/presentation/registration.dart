import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/styles/headline_text.dart';

import '../domain/state_management/user_provider.dart';

@RoutePage()
class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends ConsumerState<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = "";
    final checkbox = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Text('Create Account', style: headlineMedium),
                const Text('Fill your information below'),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      //ref.read(errorTextEmailProvider.notifier).state = true;
                    } else {
                      //ref.read(errorTextEmailProvider.notifier).state = false;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email, color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: passwordController,
                  //obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        //ref.read(obscureTextProvider.notifier).state = !obscureText;
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: Checkbox(
                        value: checkbox,
                        onChanged: (newValue) {
                          /*
                          ref.read(checkboxValueProvider.notifier).state =
                              newValue!;

                           */
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
                          text: 'Agree with ',
                          children: const [
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
                ),
                const SizedBox(height: 24.0),
                OutlinedButton(
                  onPressed: () async {
                    try {
                      await ref.read(userRepositoryProvider).signUp(
                            passwordController.text,
                            emailController.text,
                            nameController.text,
                          );
                      //
                      Navigator.pushNamed(context, '/registrationSuccessful');
                    } catch (e) {
                      showEmailAlreadyExistsMessage(context);
                    }
                  },
                  child: Text(
                    'Sign in',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginFailedMessage(BuildContext context) {
    emailController.clear();
    passwordController.clear();
    Flushbar(
      title: 'Login failed',
      message: 'Invalid email or password',
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void showEmailAlreadyExistsMessage(BuildContext context) {
    emailController.clear();
    passwordController.clear();
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
