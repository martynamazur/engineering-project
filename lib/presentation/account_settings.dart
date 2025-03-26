import 'package:ootd/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:ootd/model/setting.dart';

import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/setting_change_password.dart';



@RoutePage()
class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({super.key});

  final List<SettingOption> _accountSettingOptions = [
    SettingOption(
      title: 'Change password',
      icon: Icon(Icons.account_circle),
      navigateTo: (context) => context.router.push(SettingChangePasswordRoute()),
    ),
    SettingOption(
      title: 'Change email adress',
      icon: Icon(Icons.account_circle),
      navigateTo: (context) => context.router.push(SettingChangeEmailAdressRoute()),
    ),
    SettingOption(
      title: 'Delete my account',
      icon: Icon(Icons.account_circle),
      navigateTo: (context) => context.router.push(SettingDeleteAccountRoute()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account settings'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context, index){
                      final option = _accountSettingOptions[index];
                      return ListTile(
                        title: Text(option.title),
                        onTap: (){
                          option.navigateTo(context);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: _accountSettingOptions.length)
              ],
            ),
          )
      ),
    );
    }
  }

