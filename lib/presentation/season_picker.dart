import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/season_provider.dart';
import '../model/clothing_item.dart';

class SeasonPicker extends ConsumerStatefulWidget {
  final List<Season?> clothingItemSeason;
  final ValueChanged<List<Season?>> onSeasonChanged;


  SeasonPicker(this.clothingItemSeason, this.onSeasonChanged);

  @override
  ConsumerState<SeasonPicker> createState() => _SeasonPickerState();
}

class _SeasonPickerState extends ConsumerState<SeasonPicker> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Season', style: headline32),
          Text('Pick appropriate seasons ', style: headline),
          SizedBox(height: 24),
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
                  if (selectedSeason != null) {
                    setState(() {
                      if (widget.clothingItemSeason.contains(selectedSeason)) {
                        widget.clothingItemSeason.remove(selectedSeason);
                      } else {
                        widget.clothingItemSeason.add(selectedSeason);
                      }
                    });
                  }
                  widget.onSeasonChanged(widget.clothingItemSeason);
                },
              );
            },
          ),
        ],
      ),
    );;
  }
}
