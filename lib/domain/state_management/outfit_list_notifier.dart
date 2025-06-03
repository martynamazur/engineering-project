import 'package:ootd/model/outfit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'outfit_provider.dart';

part 'outfit_list_notifier.g.dart';

/*
To dotyczy listy z outfitami jesli zajda tutaj zmiany
w jakiejkolwiek zmiennej etc to Ui odswiezy ekran z lista !!!

 */
@riverpod
class OutfitListNotifier extends _$OutfitListNotifier {
  List<Outfit> _originalList = [];
  String? _selectedSeason;
  List<int> selectedDefaultTagIds = [];

  @override
  Future<List<Outfit>> build() async {
    final outfitsList = await ref.watch(getOwnedOutfitsProvider.future);
    _originalList = outfitsList;
    return outfitsList;
  }


  Future<void> sortBySeason(String season) async {
    _selectedSeason = season;
    applyFilters();
  }

  // Obsługa dodawania i usuwania tagów przez ID
  void toggleTagFilter(int tagId) {
    if (selectedDefaultTagIds.contains(tagId)) {
      selectedDefaultTagIds.remove(tagId);
    } else {
      selectedDefaultTagIds.add(tagId);
    }
    //applyFilters();
  }

  // Zastosuj wszystkie filtry (sezon + tagi)
  void applyFilters() {
    List<Outfit> filteredList = _originalList;

    // Filtrowanie po sezonie
    if (_selectedSeason != null && _selectedSeason!.isNotEmpty) {
      filteredList = filteredList.where((outfit) {
        return outfit.season == _selectedSeason || outfit.season =='all';
      }).toList();
    }

    // Filtrowanie po ID tagów defaultowe
    if (selectedDefaultTagIds.isNotEmpty) {
      filteredList = filteredList.where((outfit) {
        final tags = outfit.defaultTags ?? [];
        return selectedDefaultTagIds.any((tagId) => tags.contains(tagId));
      }).toList();
    }


    state = AsyncData(filteredList);
  }


  void clearFilters() {
    _selectedSeason = null;
    selectedDefaultTagIds.clear();
    state = AsyncData(_originalList);
  }

  Future<void> _fetchOutfits() async{
    final outfitsList = await ref.read(getOwnedOutfitsProvider.future);
    state = AsyncValue.data(outfitsList);
  }
  
  Future<void> removeOutfit(int outfitId) async{
    _originalList = _originalList.where((outfit) => outfit.id != outfitId).toList();
    state = AsyncData(_originalList);
  }


}
