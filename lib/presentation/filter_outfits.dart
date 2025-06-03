import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/category_provider.dart';
import '../domain/state_management/filter_provider.dart';
import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/season_provider.dart';
import '../domain/state_management/tag_provider.dart';
import '../model/clothing_item.dart';


@RoutePage()
class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<Season> _pickedSeasons = [];
  final seasonMap = {
    1: Season.winter,
    2: Season.spring,
    3: Season.summer,
    4: Season.autumn,
  };
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtry'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Obsługa czyszczenia filtrów
              ref.read(outfitListNotifierProvider.notifier).clearFilters();
            },
            icon: const Icon(Icons.format_clear),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(child: Text('Clear')),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSeason(ref),
              _buildTags(ref),
            ],
          ),
        ),
      ),
        bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

BottomAppBar _buildBottomAppBar(BuildContext context) {
  return BottomAppBar(
        color: Colors.grey,
        child: GestureDetector(
          onTap: (){
            ref.watch(outfitListNotifierProvider.notifier).applyFilters();
            Navigator.pop(context);
          },
          child: Container(
            child: Center(
              child: TextButton(
                  onPressed: () {
                    context.router.maybePop();
                    },
                  child: Text(context.loc.applyFilters,style: const TextStyle(fontSize: 18, color: Colors.white),)
              ),
            ),
          ),
        ),
      );
}

  Widget _buildSeason(WidgetRef ref) {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${context.loc.seasonHeader}:', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 12.0),
        if (seasonList.isNotEmpty)
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: seasonList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final season = seasonList[index];

              return SelectableSeasonTile(
                season: season,
                onTap: () {
                  setState(() {
                    final selectedSeason = seasonMap[season.id];
                    if (_pickedSeasons.contains(selectedSeason)) {
                      _pickedSeasons.remove(selectedSeason);
                      print(_pickedSeasons.contains(season));
                    } else {
                      _pickedSeasons.clear();
                      _pickedSeasons.add(selectedSeason!);
                    }
                  });
                  ref.read(selectedFilterSeasonProvider.notifier).state = season.id;
                  ref.read(outfitListNotifierProvider.notifier).sortBySeason(season.seasonName);
                }, isSelected: _pickedSeasons.contains(seasonMap[season.id]),
              );
            },
          )
        else
          Center(child: Text(context.loc.noSeasonAvailableMessage)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTags(WidgetRef ref) {
    final tagList = ref.watch(getDefaultTagsListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.tagsHeader, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 12.0),
        tagList.when(
          data: (data) {
            return Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: data.map((tag) {
                bool isSelected = ref.watch(outfitListNotifierProvider.notifier).selectedDefaultTagIds.contains(tag.tagId);

                return ChoiceChip(
                    label: Text(tag.tagName),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        isSelected = selected;
                      });
                      ref.read(outfitListNotifierProvider.notifier).toggleTagFilter(tag.tagId);
                    },
                    avatar: Container(
                        width: 24,
                        height: 24,
                        child:
                        Image.asset(tag.tagImagePath, fit: BoxFit.cover)));
              }).toList(),
            );
          },
          error: (error, stack) {
            return Center(child: Text('Error loading tags: $error'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
