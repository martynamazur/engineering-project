import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/outfit_provider.dart';
import 'package:ootd/model/outfit.dart';

import '../domain/state_management/season_provider.dart';

@RoutePage()
class EditOutfitDetailsScreen extends ConsumerStatefulWidget {
  final Outfit outfit;

  const EditOutfitDetailsScreen(this.outfit, {super.key});

  @override
  ConsumerState<EditOutfitDetailsScreen> createState() =>
      _EditOutfitDetailsState();
}

class _EditOutfitDetailsState extends ConsumerState<EditOutfitDetailsScreen> {
  late String _selectedSeason;
  List<String> _newTags = []; //nowe ktore dodaje
  List<String> _allTags = [];
  //lista aby wyswietlic wszystkie aktualne tagi stare+nowe

  @override
  void initState() {
    super.initState();
    _selectedSeason = widget.outfit.season;
    _allTags = widget.outfit.userTags!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(context),
      appBar: AppBar(
        title: Text(context.loc.editInformationHeader),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [_buildSeasonSection(), _buildTagSection()],
        ),
      )),
    );
  }

  Padding _buildBottomNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () async{
            // zapis db jako update bo mam i tak tablice poprzednia z obiektu outfit
            //cofniecie sie do ekranu porpzedniego
            //odswiezenie sekcji Tagi
            //odswiezenie sekcji Season

            final messenger = ScaffoldMessenger.of(context);
            if(_newTags.isNotEmpty) ref.read(editOutfitInformationTagsProvider([..._newTags,..._allTags], widget.outfit.id));
            if(_selectedSeason != widget.outfit.season)
              {
                final result = await ref.read(editOutfitInformationSeasonProvider(_selectedSeason, widget.outfit.id).future);
                if(result.success){
                  messenger.showSnackBar(
                    SnackBar(content: Text(context.loc.updateOutfitSuccess)),
                  );

                  ref.invalidate(getOutfitProvider(widget.outfit.id));
                  //to pobierze od nowa cala liste strojów
                  //problem bo przekazuje obiekt bez pobierania danych ponownie wiec po odswiezeniu nic sie nie dzieje
                }else{
                  messenger.showSnackBar(
                    SnackBar(content: Text(context.loc.updateOutfitFailure)),
                  );
                }
              }
            context.router.maybePop();

          },
          child: Text(context.loc.save),
        ),
      ),
    );
  }

  Widget _buildSeasonSection() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.seasonHeader,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
        GridView.builder(
            shrinkWrap: true,
            itemCount: seasonList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      Text(context.loc.tagsHeader,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)
      ),
      Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: [..._newTags,..._allTags].map((tag) => Chip(label: Text(tag))).toList(),
      ),
      IconButton(
          onPressed: () => _showAddNewTagDialog(),
          icon: const Icon(Icons.add))
    ]);
  }

  void _showAddNewTagDialog() {
    String newTag = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.addNewTag),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: context.loc.enterNewTag),
            onChanged: (value) => newTag = value.trim(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.loc.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTag.isNotEmpty && !_newTags.contains(newTag)) {
                  setState(() {
                    _newTags.add(newTag);
                  });
                }
                context.router.maybePop();
              },
              child: Text(context.loc.add),
            ),
          ],
        );
      },
    );
  }
}
