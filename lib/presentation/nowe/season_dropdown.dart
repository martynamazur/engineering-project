import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/state_management/season_provider.dart';

class SeasonDropdown extends ConsumerStatefulWidget {
  @override
  _SeasonDropdownState createState() => _SeasonDropdownState();
}

class _SeasonDropdownState extends ConsumerState<SeasonDropdown> {
  String? _selectedSeason;

  @override
  Widget build(BuildContext context) {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();

    return Scaffold(
      appBar: AppBar(title: Text('Choose Season')),
      body:
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
    );
        }
}
