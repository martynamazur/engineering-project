import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ootd/presentation/styles/selectable_season_tile.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


import '../domain/state_management/category_provider.dart';
import '../domain/state_management/season_provider.dart';
import '../domain/state_management/tag_provider.dart';
import '../model/tag.dart';
class AddClothesInformation extends ConsumerStatefulWidget {
  AddClothesInformation({super.key});

  @override
  ConsumerState createState() => _AddClothesInformationState();
}

class _AddClothesInformationState extends ConsumerState<AddClothesInformation> {
  late final GlobalKey<FormState> _formKey;
  late final PageController _pageController;
  late final TextEditingController addNewTagController;
  late final int _currentPage;
  late final List<Tag> markedTags;



  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _pageController = PageController();
    addNewTagController = TextEditingController();
    _currentPage = 0;
    markedTags = [];
  }

  @override
  void dispose() {
    super.dispose();
    addNewTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Scaffold(
      body: SafeArea(
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
                  print('o kurde');
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
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text('Cofnij')),
                OutlinedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text('Dalej'))
              ],
            )
          ],
        ),
      ),
    );
  }



  Widget _pickSeason() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pora roku'),
        Text('Ten outfit mogę ubrac w'),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
          ),
          itemCount: seasonList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final season = seasonList[index];
            return SelectableSeasonTile(
                season : season,
                onTap: () {
                  ref.read(selectedSeasonProvider.notifier).state = season.id;
                },

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
      Text('Dodaj tagi'),
      Text('Pozniej szybciej znajdziesz to czego szukasz'),
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
        error: (e, st) => Text('ups'),
        loading: () => CircularProgressIndicator(),
      ),
      OutlinedButton(
          onPressed: () {
            addTagDialog(context);
          },
          child: Text('Nowy tag'))
    ]);
  }

  void addTagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                  TextFormField(
                    controller: addNewTagController,
                    decoration:
                        InputDecoration(hintText: 'Kliknij aby dodac tag'),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Pole nie moze byc puste';
                      }else if(value.length == 1){
                        return 'Wpisz poprawny tag';
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            //Navigator.of(context).pop();
                          },
                          child: Text('Anuluj')),
                      OutlinedButton(
                          onPressed: () {
                            if(_formKey.currentState?.validate() ?? false){
                              //add to the databse new tag
                              //Navigator.of(context).pop();
                            }
                          },
                          child: Text('Dodaj'))
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


