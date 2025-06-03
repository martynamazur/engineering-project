import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/outfit_provider.dart';

@RoutePage()
class OutfitOverviewScreen extends ConsumerStatefulWidget {
  final int _outfitId;

  const OutfitOverviewScreen({super.key, required int outfitId}) : _outfitId = outfitId;

  @override
  ConsumerState<OutfitOverviewScreen> createState() =>
      _OutfitOverviewScreenState();
}

class _OutfitOverviewScreenState extends ConsumerState<OutfitOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    int? selectedValue;
    final outfit = ref.watch(getOutfitProvider(widget._outfitId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Outfit Overview'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white70,
            child: IconButton(
              onPressed: () {
                //ShareContentManager(outfit.value!.imageUrl).onSharePhotoLink(context);
              },
              icon: const Icon(Icons.share),
            ),
          ),
          DropdownButton(
              icon: const Icon(Icons.edit),
              value: selectedValue,
              underline: const SizedBox.shrink(),
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              items: [
                DropdownMenuItem(value: 1, child: Text(context.loc.edit)),
                DropdownMenuItem(value: 2, child: Text(context.loc.delete)),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });

                switch (value) {
                  case 1:
                    context.router.push(EditOutfitDetailsRoute(outfit: outfit.value!));
                    break;
                  case 2:
                    _showConfirmDeletionDialog(outfitId: widget._outfitId);
                }
              })
        ],
      ),
      body: outfit.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image.network(data.imageUrl),
                CachedNetworkImage(
                  imageUrl: data.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Text('${context.loc.seasonHeader} : ${data.season}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                _buildTagsSection(context.loc.tagsHeader, data.userTags),
                // Add more fields from your `Outfit` class
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildTagsSection(String title, List<String>? tags) {
    if (tags == null || tags.isEmpty) {
      return Row(
        children: [
          Text('$title: ${context.loc.noTagsAvailableMessage}.'),
          OutlinedButton(onPressed: (){}, child: Text(context.loc.addAnewTag))
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: tags.map((tag) {
            return Chip(
              label: Text(tag),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showConfirmDeletionDialog({required int outfitId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete?'),
          content: const Text('This action will be permanent and cannot be undone.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    ref.read(deleteOutfitProvider(outfitId));
                    ref.read(outfitListNotifierProvider.notifier).removeOutfit(outfitId);

                    if (mounted) {
                      context.router.maybePop();
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.restore_from_trash),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }




}

