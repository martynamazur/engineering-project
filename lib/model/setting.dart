import 'package:flutter/cupertino.dart';

class SettingOption{

  final String title;
  final Icon icon;
  final String route;

  SettingOption({required this.title, required this.icon, required this.route});

  SettingOption.name(this.title, this.icon,this.route);

}