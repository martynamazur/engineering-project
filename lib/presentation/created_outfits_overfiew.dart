import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/navigation/app_router.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/outfit_provider.dart';
import '../utils/show_confirm_deletion_dialog.dart';
import 'outfit_overfiew.dart';



@RoutePage()
class CreatedOutfitsScreen extends ConsumerStatefulWidget {
  const CreatedOutfitsScreen({super.key});

  @override
  ConsumerState<CreatedOutfitsScreen> createState() =>
      _CreatedOutfitsScreenState();
}

class _CreatedOutfitsScreenState extends ConsumerState<CreatedOutfitsScreen> {
  @override
  Widget build(BuildContext context) {
    final outfitState = ref.watch(outfitListNotifierProvider);
    print('ootd $outfitState');

    return Scaffold(
      appBar: AppBar(
        title: Text('Outfits'),
        actions: [
          IconButton(onPressed: (){
            context.router.push(ChooseTemplateRoute());
          }, icon: Icon(Icons.add_circle_outlined)
          ),

          IconButton(
            onPressed: () {
              context.router.push(FilterRoute());
            },
            icon: Icon(Icons.filter_list_alt),
          ),

        ],
      ),
      body: SafeArea(
        child: outfitState.when(
          data: (data) {
            print("data tak $data");
            if (data.isEmpty) {
              return Center(
                child: Text(
                  'Brak danych do wyświetlenia',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final outfit = data[index];
                  return GestureDetector(
                    onTap: () {
                      context.router.push(OutfitOverviewRoute(outfitId: outfit.id));
                    },
                    onLongPress: () => showConfirmDeletionDialog(context: context, ref: ref, outfitId: outfit.id),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        outfit.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (err, stack) {
            return Center(
              child: Text(
                'Wystąpił błąd: $err',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }



}
