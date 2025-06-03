import 'package:ootd/extensions/localization_extension.dart';

import 'package:ootd/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:ootd/model/setting.dart';




@RoutePage()
class AccountSettingsScreen extends StatelessWidget  {
  AccountSettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final List<SettingOption> accountSettingOptions = [
      SettingOption(
        title: context.loc.changePasswordTitle,
        icon: const Icon(Icons.password),
        navigateTo: (context) => context.router.push(SettingChangePasswordRoute()),
      ),
      SettingOption(
        title: context.loc.changeEmailAddress,
        icon: const Icon(Icons.email),
        navigateTo: (context) => context.router.push(SettingChangeEmailAdressRoute()),
      ),
      SettingOption(
        title: context.loc.deleteMyAccountTitle,
        icon: const Icon(Icons.person_remove),
        navigateTo: (context) => context.router.push(SettingDeleteAccountRoute()),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accountSettingsHeader),
      ),
      body: SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index){
                final option = accountSettingOptions[index];
                return ListTile(
                  title: Text(option.title),
                  leading: option.icon,
                  onTap: () => option.navigateTo(context),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: accountSettingOptions.length)
      ),
    );
    }
  }

