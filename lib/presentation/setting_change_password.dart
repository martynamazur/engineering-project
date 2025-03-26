import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingChangePasswordScreen extends ConsumerStatefulWidget {
  const SettingChangePasswordScreen({super.key});

  @override
  ConsumerState createState() => _SettingChangePasswordState();
}

class _SettingChangePasswordState extends ConsumerState<SettingChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Text('Enter your old and then new password')
          
        ],
      )),
    );
  }
}
