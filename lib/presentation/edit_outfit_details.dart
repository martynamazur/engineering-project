import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/outfit_list_notifier.dart';
import 'package:ootd/domain/state_management/outfit_provider.dart';
import 'package:ootd/model/outfit.dart';
import 'package:ootd/model/season.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/season_dropdown.dart';
import 'package:screenshot/screenshot.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../domain/state_management/clothes_category_provider.dart';
import '../domain/state_management/season_provider.dart';
import 'package:filter_list/filter_list.dart';

@RoutePage()
class EditOutfitDetailsScreen extends ConsumerStatefulWidget {
  final Outfit outfit;

  EditOutfitDetailsScreen(this.outfit, {super.key});

  @override
  ConsumerState<EditOutfitDetailsScreen> createState() =>
      _EditOutfitDetailsState();
}

class _EditOutfitDetailsState extends ConsumerState<EditOutfitDetailsScreen> {
  late String _selectedSeason;
  List<String> _newTags = ['grzesiu']; //nowe ktore dodaje
  List<String> _allTags = [];
  //lista aby wyswietlic wszystkie aktualne tagi stare+nowe

  @override
  void initState() {
    super.initState();
    _selectedSeason = widget.outfit.season;
    print(widget.outfit.userTags);
    _allTags = widget.outfit.userTags!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () async{
              // zapis db jako update bo mam i tak tablice poprzednia z obiektu outfit
              //cofniecie sie do ekranu porpzedniego
              //odswiezenie sekcji Tagi
              //odswiezenie sekcji Season

              if(_newTags.isNotEmpty) ref.read(editOutfitInformationTagsProvider([..._newTags,..._allTags], widget.outfit.id));
              if(_selectedSeason != widget.outfit.season) ref.read(editOutfitInformationSeasonProvider(_selectedSeason, widget.outfit.id));
              ref.invalidate(getOutfitProvider(widget.outfit.id));//to pobierze od nowa cala liste strojów
              //problem bo przekazuje obiekt bez pobierania danych ponownie wiec po odswiezeniu nic sie nie dzieje

              print('tags: $_newTags, season: $_selectedSeason');
              if(mounted)context.router.maybePop();

            },
            child: Text('Save'),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Edit information'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildSeasonSection(), _buildTagSection()],
          ),
        ),
      )),
    );
  }

  Widget _buildSeasonSection() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Season',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
        GridView.builder(
            shrinkWrap: true,
            itemCount: seasonList.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final season = seasonList[index];
              return CheckboxListTile(
                  title: Text(season.seasonName),
                  value: _selectedSeason == season.seasonName,
                  onChanged: (value) {
                    setState(() {
                      if (_selectedSeason != season.seasonName) {
                        _selectedSeason = season.seasonName;
                      }
                    });
                  });
            }),
      ],
    );
  }

  Widget _buildTagSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text('Tags',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
      Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: [..._newTags,..._allTags].map((tag) => Chip(label: Text(tag))).toList(),
      ),
      IconButton(
          onPressed: () => _addNewTagDialog(),
          icon: Icon(Icons.add))
    ]);
  }


  void _addNewTagDialog() {
    String newTag = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dodaj nowy tag'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Wpisz nowy tag'),
            onChanged: (value) {
              newTag = value.trim();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Anuluj'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTag.isNotEmpty && !_newTags.contains(newTag)) {
                  setState(() {
                    _newTags.add(newTag);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Dodaj'),
            ),
          ],
        );
      },
    );
  }


}
