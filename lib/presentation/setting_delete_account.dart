import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/user_provider.dart';

import '../navigation/app_router.dart';


@RoutePage()
class SettingDeleteAccountScreen extends ConsumerStatefulWidget {
  const SettingDeleteAccountScreen({super.key});

  @override
  ConsumerState<SettingDeleteAccountScreen> createState() => _SettingDeleteAccountScreenState();
}



class _SettingDeleteAccountScreenState extends ConsumerState<SettingDeleteAccountScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.deleteAccountHeader),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.loc.deleteAccountWarningText),
                OutlinedButton(
                    onPressed: _isLoading ? null : _confirmAndDelete,
                    child: _isLoading ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        )
                    ) : Text(
                      context.loc.deleteAccountHeader,
                      style: const TextStyle(color: Colors.redAccent))
                )
              ],
            ),
          ),
        ),
      ),
    ) ;

  }

Future<void> _onDeleteAccountPressed() async {
  if (_isLoading) return;

  setState(() => _isLoading = true);

  final messenger = ScaffoldMessenger.of(context);
  final result = await ref.read(userRepositoryProvider).requestAccountDeletion();

  if (!result.success) {
    messenger.showSnackBar(SnackBar(content: Text(result.errorMessage!)));
    setState(() => _isLoading = false);
    return;
  }

  final resultSignOut = await ref.read(userRepositoryProvider).signOut();

  setState(() => _isLoading = false);

  if (resultSignOut.success) {
    messenger.showSnackBar(SnackBar(content: Text(context.loc.logoutSuccess)));
    context.router.replaceAll([const LoginRoute()]);
  } else {
    messenger.showSnackBar(SnackBar(content: Text(resultSignOut.errorMessage!)));
  }
}

  Future<void> _confirmAndDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.loc.doYouWantToDelete),
        content: Text(context.loc.deleteConfirmation),
        actions: [
          TextButton(onPressed: () => context.maybePop(false), child: Text(context.loc.cancel)),
          TextButton(onPressed: () => context.maybePop(true), child: Text(context.loc.delete)),
        ],
      ),
    );

    if (confirmed == true) {
      _onDeleteAccountPressed();
    }
  }


}
