import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/model/outfit.dart';
import 'package:ootd/presentation/nowe/season_dropdown.dart';
import 'package:screenshot/screenshot.dart';

import '../../domain/state_management/clothes_category_provider.dart';
import '../../domain/state_management/season_provider.dart';

@RoutePage()
class EditOutfitDetailsScreen extends ConsumerStatefulWidget {
  final Outfit outfit;


  EditOutfitDetailsScreen(this.outfit, {super.key});

  @override
  ConsumerState<EditOutfitDetailsScreen> createState() => _EditOutfitDetailsState();
}

class _EditOutfitDetailsState extends ConsumerState<EditOutfitDetailsScreen> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildSeasonSection()
            
              ],),
          )),
    );
  }
  Widget _buildSeasonSection(){
    String? _selectedSeason;
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
              _selectedSeason = newValue;
            });
          },
        )
      ],
    );
  }
}