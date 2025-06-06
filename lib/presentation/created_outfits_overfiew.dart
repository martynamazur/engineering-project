import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/utils/image_loading_builder.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../utils/show_confirm_deletion_dialog.dart';



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

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.outfits),
        actions: [
          IconButton(onPressed: () => context.router.push(const ChooseTemplateRoute()),
              icon: const Icon(Icons.add_circle_outlined)
          ),

          IconButton(
            onPressed: () => context.router.push(const FilterRoute()),
            icon: const Icon(Icons.filter_list_alt),
          ),

        ],
      ),
      body: SafeArea(
        child: outfitState.when(
          data: (data) {
            if (data.isEmpty) {
              return Center(
                child: Text(
                  context.loc.noDataToDisplayMessage,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final outfit = data[index];
                  return GestureDetector(
                    onTap: () => context.router.push(OutfitOverviewRoute(outfitId: outfit.id)),
                    onLongPress: () => showConfirmDeletionDialog(context: context, ref: ref, outfitId: outfit.id),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        outfit.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: imageLoadingBuilder,
                        errorBuilder: imageErrorBuilder,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (err, stack) {
            return Center(
              child: Column(
                children: [
                  Text(context.loc.errorGeneralMessage),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(outfitListNotifierProvider),
                    child: Text(context.loc.tryAgain),
                  ),
                ],
              )
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
