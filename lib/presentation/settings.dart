import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/navigation/app_router.dart';

import '../../model/setting.dart';
import '../domain/state_management/user_provider.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  SettingsScreen({super.key});

  final List<SettingOption> settingsOptions = [
    SettingOption(
      title: 'Account Settings',
      icon: Icon(Icons.account_circle),
      navigateTo: (context) => context.router.push(AccountSettingsRoute()),
    ),
    SettingOption(
      title: 'Notification Settings',
      icon: Icon(Icons.notifications),
      navigateTo: (context) => context.router.push(AccountSettingsRoute()),
    ),
    SettingOption(
      title: 'Privacy Settings',
      icon: Icon(Icons.privacy_tip),
      navigateTo: (context) => context.router.push(AccountSettingsRoute()),
    ),
    SettingOption(
      title: 'Help & Support',
      icon: Icon(Icons.help),
      navigateTo: (context) => context.router.push(AccountSettingsRoute()),
    ),

  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(userRepositoryProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
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
                    trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16.0),
                    title: Text(option.title),
                    onTap: () {
                      option.navigateTo(context);
                      //Navigator.pushNamed(context, option.navigateTo);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app_outlined, color: Colors.deepOrangeAccent),
                title: Text('Log out', style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w600)),
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


