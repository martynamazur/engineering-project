import 'package:flutter/cupertino.dart';

class SettingOption{

  final String title;
  final Icon icon;
  final void Function(BuildContext) navigateTo;


  SettingOption({required this.title, required this.icon, required this.navigateTo});

  SettingOption.name(this.title, this.icon,this.navigateTo);

}