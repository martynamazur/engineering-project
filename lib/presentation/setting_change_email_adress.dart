import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/user_provider.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class SettingChangeEmailAdressScreen extends ConsumerStatefulWidget {
  const SettingChangeEmailAdressScreen({super.key});


  @override
  ConsumerState createState() => _SettingChangeEmailAdressState();
}

class _SettingChangeEmailAdressState extends ConsumerState<SettingChangeEmailAdressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentEmailAddress =  Supabase.instance.client.auth.currentUser?.userMetadata?['email'];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.changeEmailAddress),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: currentEmailAddress,
                    enabled: false
                  ),
                  keyboardType: TextInputType.emailAddress,

                ),
                const SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value){
                      if( value == null || value.isEmpty ){
                        _invalidInputMessage(); //before checking
                        return context.loc.invalidEmail;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.newEmailAddressLabel
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                OutlinedButton(onPressed: (){
                  _validateEmailInput();
                }, child: Text(context.loc.changeLabel))
              ],
            ),
          )),
    );
  }

  void _invalidInputMessage() {
    _emailController.clear();
    Flushbar(
      title: 'Ups',
      message: 'Invalid email',
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
    ).show(context);
  }

  Future<void> _validateEmailInput() async {
    if(_formKey.currentState?.validate() ?? false){
      try{
        await ref.read(userRepositoryProvider).changeEmailAdress(_emailController.text.trimRight());
        context.router.push(EmailAddressSentConfirmationRoute());
      }catch(e){
        _showEmailAlreadyExistsMessage();
      }
    }
  }

  void _showEmailAlreadyExistsMessage() {
    Flushbar(
      title: 'Błąd',
      message: 'Podany adres e-mail już istnieje.',
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.deepOrange,
    ).show(context);
  }


}
