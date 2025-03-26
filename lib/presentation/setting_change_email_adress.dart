import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentEmailAdress =  Supabase.instance.client.auth.currentUser?.userMetadata?['email'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Change email adress'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: currentEmailAdress,
                  enabled: false
                ),
                keyboardType: TextInputType.emailAddress,

              ),
              SizedBox(height: 32.0),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value){
                    if( value == null || value.isEmpty ){
                      invalidInputMessage(); //before checking
                      return 'Invalid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'New email adress'
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              OutlinedButton(onPressed: (){
                validateEmailInput();



              }, child: Text('Change'))
            ],
          )),
    );
  }

  void invalidInputMessage() {
    _emailController.clear();
    Flushbar(
      title: 'Ups',
      message: 'Invalid email',
      duration: Duration(seconds: 10),
      backgroundColor: Colors.redAccent,
    ).show(context);
  }

  Future<void> validateEmailInput() async {
    if(_formKey.currentState?.validate() ?? false){
      try{
        await ref.read(userRepositoryProvider).changeEmailAdress(_emailController.text.trimRight());
        context.router.push(EmailAddressSentConfirmationRoute());
      }catch(e){
        showEmailAlreadyExistsMessage();
      }
    }
  }

  void showEmailAlreadyExistsMessage() {}

  //email already exists fun

}
