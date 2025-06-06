import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/season_provider.dart';
import '../model/clothing_item.dart';

class SeasonPicker extends ConsumerStatefulWidget {
  final List<Season?> clothingItemSeason;
  final ValueChanged<List<Season?>> onSeasonChanged;


  const SeasonPicker(this.clothingItemSeason, this.onSeasonChanged, {super.key});

  @override
  ConsumerState<SeasonPicker> createState() => _SeasonPickerState();
}

class _SeasonPickerState extends ConsumerState<SeasonPicker> {

  @override
  Widget build(BuildContext context) {
    final seasonList= ref.watch(getSeasonListProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.seasonHeader, style: headline32),
          Text(context.loc.seasonSubheader, style: headline),
          const SizedBox(height: 24),
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
              final seasonMap = {
                1: Season.winter,
                2: Season.spring,
                3: Season.summer,
                4: Season.autumn,
              };
              return SelectableSeasonTile(
                season: season,
                isSelected: widget.clothingItemSeason.contains(seasonMap[season.id]),
                onTap: () {
                  final selectedSeason = seasonMap[season.id];
                  final updatedList = [...widget.clothingItemSeason];
                  if (selectedSeason != null) {
                    if (widget.clothingItemSeason.contains(selectedSeason)) {
                      updatedList.remove(selectedSeason);
                    } else {
                      updatedList.add(selectedSeason);
                    }

                    setState(() {
                      widget.onSeasonChanged(updatedList);
                    });
                  }
                  widget.onSeasonChanged(widget.clothingItemSeason);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
