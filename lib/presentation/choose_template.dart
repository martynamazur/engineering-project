import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ootd/extensions/localization_extension.dart';
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
    final templates = [_buildEmptyTemplate(), _buildFirstTemplate(), _buildFirstTemplate()];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.templateHeader),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: templates.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstTemplate() {
    return Column(
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

  Widget _buildEmptyTemplate() {
    return GestureDetector(
      onTap: () => context.router.push(CreateOutfitRoute(templateId: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_box_rounded),
          Text(context.loc.createFromEmptyMessage),
        ],
      ),
    );
  }
}
