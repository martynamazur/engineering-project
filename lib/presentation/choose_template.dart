import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ootd/navigation/app_router.dart';

@RoutePage()
class ChooseTemplateScreen extends StatefulWidget {
  const ChooseTemplateScreen({super.key});

  @override
  State<ChooseTemplateScreen> createState() => _ChooseTemplateScreenState();
}

class _ChooseTemplateScreenState extends State<ChooseTemplateScreen> {
  @override
  Widget build(BuildContext context) {
    final templates = [_emptyTemplate(), _templateOne(), _templateOne()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Template'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: templates.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0),
                    itemBuilder: (context, index) {
                      final template = templates[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey),
                        child: template,
                      );
                    }),
              ),
              //OutlinedButton(onPressed: (){}, child: Text('Create from empty'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _templateOne() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/category_icon/category_icon_test.png',
            height: 20, width: 20),
        Image.asset('assets/category_icon/category_icon_test.png',
            height: 20, width: 20),
        Image.asset('assets/category_icon/category_icon_test.png',
            height: 20, width: 20),
      ],
    );
  }

  Widget _emptyTemplate() {
    return GestureDetector(
      onTap: () {
        context.router.push(CreateOutfitRoute(templateId: 1));
        print('kliklam');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_box_rounded),
          Text('Create from empty'),
        ],
      ),
    );
  }
}
