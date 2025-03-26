import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/clothes_folder_provider.dart';

import '../../domain/state_management/outfit_list_notifier.dart';

@RoutePage()
class PickOwnedClothesScreen extends ConsumerStatefulWidget {
  final int _folderId;
  const PickOwnedClothesScreen(this._folderId, {super.key});

  @override
  ConsumerState<PickOwnedClothesScreen> createState() => _PickOwnedClothesScreenState();
}

class _PickOwnedClothesScreenState extends ConsumerState<PickOwnedClothesScreen> {


  @override
  Widget build(BuildContext context) {
    final clothesList = ref.watch(getAllClothesProvider);
    //zmienic z outfit na liste wszystkich ciuchow

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick clothes'),
      ),
      body: clothesList.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text(
                'Brak danych do wyświetlenia',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final outfit = data[index];
                      print("ott $outfit");
                      print("dlugosc ${data.length}");
                      return GestureDetector(
                        onTap: () async{
                          ref.read(addClothesToFolderProvider([outfit.clothingItemId!],widget._folderId));
                          context.router.maybePop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            outfit.itemPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),


              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
