
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';

import 'package:ootd/presentation/styles/selectable_season_tile.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


import '../domain/state_management/category_provider.dart';
import '../domain/state_management/season_provider.dart';
import '../domain/state_management/tag_provider.dart';
import '../model/tag.dart';
class AddClothesInformation extends ConsumerStatefulWidget {
  const AddClothesInformation({super.key});

  @override
  ConsumerState createState() => _AddClothesInformationState();
}

class _AddClothesInformationState extends ConsumerState<AddClothesInformation> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _addNewTagController = TextEditingController();

  late final PageController _pageController;
  late final List<Tag> markedTags;
  late int _currentPage;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = 0;
    markedTags = [];
  }

  @override
  void dispose() {
    super.dispose();
    _addNewTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: _currentPage + 1,
                selectedColor: Colors.red,
                unselectedColor: Colors.yellow,
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _pickSeason(),
                  _pickTags(),
                ],
              )),
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Text(context.loc.previous)),
                  OutlinedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Text(context.loc.next))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget _pickSeason() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.seasonHeader),
        Text(context.loc.seasonInformationMessage),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
          ),
          itemCount: seasonList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final season = seasonList[index];
            return SelectableSeasonTile(
                season : season,
                onTap: () {
                  ref.read(selectedSeasonProvider.notifier).state = season.id;
                }, isSelected: false,

            );
          },
        ),
      ],
    );
  }

  Widget _pickTags() {
    final tagList = ref.watch(getDefaultTagsListProvider);
    final List<int> selectedTags = [];

    return Column(children: [
      Text(context.loc.addTag),
      Text(context.loc.findFasterLater),
      tagList.when(
        data: (data) {
          return Wrap(
            spacing: 8.0,
            children: data.map((tag) {
              return ChoiceChip(
                label: Text(tag.tagName),
                selected: selectedTags.contains(tag.tagId),
                onSelected: (selected) {
                  setState(() {
                    selected
                        ? selectedTags.add(tag.tagId)
                        : selectedTags.remove(tag.tagId);
                  });
                },
              );
            }).toList(),
          );
        },
        error: (e, st) => const Text('Something went wrong'),
        loading: () => const CircularProgressIndicator(),
      ),
      OutlinedButton(
          onPressed: () {
            _addTagDialog(context);
          },
          child: Text(context.loc.newTag))
    ]);
  }

  void _addTagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 200,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () => context.router.maybePop(),
                      icon: const Icon(Icons.close)),
                  TextFormField(
                    controller: _addNewTagController,
                    decoration:
                        InputDecoration(hintText: context.loc.addTagHint),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return context.loc.emptyTagField;
                      }else if(value.length == 1){
                        return context.loc.invalidTag;
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () => context.router.maybePop(),
                          child: Text(context.loc.cancel)),
                      OutlinedButton(
                          onPressed: () {
                            if(_formKey.currentState?.validate() ?? false){
                              //TODO: not yet implemented. add to the databse new tag
                              context.router.maybePop();
                            }
                          },
                          child: Text(context.loc.add))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


