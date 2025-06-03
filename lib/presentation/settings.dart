import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';

import 'package:ootd/navigation/app_router.dart';

import '../../model/setting.dart';
import '../domain/state_management/user_provider.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  SettingsScreen({super.key});

  //TODO add missing screens


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SettingOption> settingsOptions = [
      SettingOption(
        title: context.loc.accountSettingsHeader,
        icon: const Icon(Icons.account_circle),
        navigateTo: (context) => context.router.push(AccountSettingsRoute()),
      ),
      SettingOption(
        title: context.loc.notificationSettingsHeader,
        icon: const Icon(Icons.notifications),
        navigateTo: (context) => context.router.push(SettingNotificationsRoute()),
      ),
      SettingOption(
        title: context.loc.privacySettingsHeader,
        icon: const Icon(Icons.privacy_tip),
        navigateTo: (context) => context.router.push(AccountSettingsRoute()),
      ),
      SettingOption(
        title: context.loc.helpAndSupportHeader,
        icon: const Icon(Icons.help),
        navigateTo: (context) => context.router.push(AccountSettingsRoute()),
      ),

    ];

    final repository = ref.watch(userRepositoryProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.settingsHeader)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: settingsOptions.length,
                itemBuilder: (context, index) {
                  final option = settingsOptions[index];
                  return ListTile(
                    leading: option.icon,
                    trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16.0),
                    title: Text(option.title),
                    onTap: () => option.navigateTo(context),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app_outlined, color: Colors.deepOrangeAccent),
                title: Text(context.loc.logOutHeader, style: const TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w600)),
                onTap: () {
                  repository.signOut(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


