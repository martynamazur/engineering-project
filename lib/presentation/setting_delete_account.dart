import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/user_provider.dart';


@RoutePage()
class SettingDeleteAccountScreen extends ConsumerStatefulWidget {
  const SettingDeleteAccountScreen({super.key});

  @override
  ConsumerState<SettingDeleteAccountScreen> createState() => _SettingDeleteAccountScreenState();
}

class _SettingDeleteAccountScreenState extends ConsumerState<SettingDeleteAccountScreen> {
@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.deleteAccountHeader),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.loc.deleteAccountWarningText),
          OutlinedButton(onPressed: () async{
            _onDeleteAccountPressed();
          },
              child: Text(context.loc.deleteAccountHeader, style: const TextStyle(color: Colors.redAccent),))
        ],
      ),
    ) ;

  }

  void _showErrorMessage(  BuildContext context) {
    Flushbar(
      title: 'Error',
      message: 'Failed to request account deletion.',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
    ).show(context);
  }

  Future<void> _onDeleteAccountPressed() async{
    try{
      await ref.read(userRepositoryProvider).requestAccountDeletion();
      await ref.read(userRepositoryProvider).signOut(context);
    }catch(e){
      _showErrorMessage(context);
    }
  }
}
