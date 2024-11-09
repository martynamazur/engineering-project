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
  List<int> selectedTagIds = [];

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
    if (selectedTagIds.contains(tagId)) {
      selectedTagIds.remove(tagId);
    } else {
      selectedTagIds.add(tagId);
    }
    //applyFilters();
  }

  // Zastosuj wszystkie filtry (sezon + tagi)
  void applyFilters() {
    List<Outfit> filteredList = _originalList;

    // Filtrowanie po sezonie
    if (_selectedSeason != null && _selectedSeason!.isNotEmpty) {
      filteredList = filteredList.where((outfit) {
        return outfit.season == _selectedSeason;
      }).toList();
    }

    // Filtrowanie po ID tagów
    if (selectedTagIds.isNotEmpty) {
      filteredList = filteredList.where((outfit) {
        return selectedTagIds.every((tagId) => outfit.id ==tagId);
      }).toList();
    }

    // Aktualizuj stan listy
    state = AsyncData(filteredList);
  }

  // Funkcja do resetowania filtrów
  void clearFilters() {
    _selectedSeason = null;
    selectedTagIds.clear();
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
