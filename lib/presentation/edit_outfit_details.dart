import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/model/outfit.dart';
import 'package:ootd/presentation/styles/season_dropdown.dart';
import 'package:screenshot/screenshot.dart';

import '../domain/state_management/clothes_category_provider.dart';
import '../domain/state_management/season_provider.dart';
import 'package:filter_list/filter_list.dart';
@RoutePage()
class EditOutfitDetailsScreen extends ConsumerStatefulWidget {
  final Outfit outfit;


  EditOutfitDetailsScreen(this.outfit, {super.key});

  @override
  ConsumerState<EditOutfitDetailsScreen> createState() => _EditOutfitDetailsState();
}

class _EditOutfitDetailsState extends ConsumerState<EditOutfitDetailsScreen> {
  String? _selectedSeason;

  @override
  void initState() {
    super.initState();
    //_selectedSeason = widget.outfit.season;
    //_selectedSeason = 'winter';
    print("jakie $_selectedSeason");
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildSeasonSection(),
                  //_buildTagSection()

                ],),
            ),
          )),
    );
  }
  Widget _buildSeasonSection(){

    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      children: [
        Text('Season'),
        DropdownButton<String>(
          value: _selectedSeason,
          hint: Text('Select a season'),
          items: seasonList.map((season) {
            return DropdownMenuItem<String>(
              value: season.seasonName,
              child: Row(
                children: [
                  Image.asset(season.seasonImagePath, width: 12, height: 12),
                  SizedBox(width: 10),
                  Text(season.seasonName),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedSeason = newValue!;
            });
          },
        )
      ],
    );
  }
/*
  Widget _buildTagSection(){
   return Column(
       children: [
         IconButton(onPressed: (){
           openTagSelectionDialog(context);
         }, icon: Icon(Icons.add))

       ]);
  }

  Future<void> openTagSelectionDialog(BuildContext context) async {

    print("Id ootd ${widget.outfit.id}");
    print(widget.outfit.defaultTags?.length);
    /*
    swtorz w hive liste z tagami domyslnymi potem je zmapuj ?
     */
    //List<String> selectedTags = widget.outfit.defaultTags!.map((tag)=> tag.tagName).toList();
    //List<String> tagList = widget.outfit.defaultTags!.map((tag)=> tag.tagName).toList();

    await FilterListDialog.display<String>(
      context,
      listData: tagList,
      selectedListData: selectedTags,
      height: 400,
      headlineText: "Wybierz tagi",
      choiceChipLabel: (item) => item ?? '',
      validateSelectedItem: (list, value) => list!.contains(value),
      onItemSearch: (tag, query) {
        return tag.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (selectedItems) {
        if (selectedItems != null) {
          setState(() {
            selectedTags = List<String>.from(selectedItems);
          });
        }
        Navigator.pop(context);
      },
    );
  }

 */
}
