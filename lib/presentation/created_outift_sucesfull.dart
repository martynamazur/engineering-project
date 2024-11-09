import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/app_router.dart';

@RoutePage()
class CreatedOutiftSucesfullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('created_outift_sucesfull'),
          OutlinedButton(onPressed:(){
            context.router.replace(ChooseTemplateRoute());

          }, child: Text('Create another')),
          OutlinedButton(onPressed:(){}, child: Text('Go to the outfit gallery '))
        ],
      )),
    );
  }
}
