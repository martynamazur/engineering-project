import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/category_provider.dart';
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
  List<Season> _pickedSeasons = [Season.autumn];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtry'),
        leading: IconButton(
          icon: Icon(Icons.close),
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
            icon: Icon(Icons.format_clear),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(child: Text('Clear')),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSeason(ref),
                _buildTags(ref),
              ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: GestureDetector(
            onTap: (){
              ref.watch(outfitListNotifierProvider.notifier).applyFilters();
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'Apply filters',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
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
        Text('Season:', style: TextStyle(fontSize: 18)),
        SizedBox(height: 12.0),
        if (seasonList.isNotEmpty)
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: seasonList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final season = seasonList[index];
              return SelectableSeasonTile(
                season: season,
                onTap: () {
                  ref.read(selectedSeasonProvider.notifier).state = season.id;
                  ref.read(outfitListNotifierProvider.notifier).sortBySeason(season.seasonName.toLowerCase());
                }, isSelected: _pickedSeasons.contains(season),
              );
            },
          )
        else
          Center(child: Text('No seasons available')),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTags(WidgetRef ref) {
    final tagList = ref.watch(getDefaultTagsListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tags', style: TextStyle(fontSize: 18)),
        SizedBox(height: 12.0),
        tagList.when(
          data: (data) {
            return Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: data.map((tag) {
                bool isSelected = ref.watch(outfitListNotifierProvider.notifier).selectedTagIds.contains(tag.tagId);

                return ChoiceChip(
                    label: Text(tag.tagName),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        isSelected = selected;
                      });
                      print('Jak wyglada tablica z id ${ref.read(outfitListNotifierProvider.notifier).selectedTagIds}');
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
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
