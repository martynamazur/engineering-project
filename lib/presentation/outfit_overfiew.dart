import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/data/service/share_content_manager.dart';
import 'package:ootd/model/outfit.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/model/tag.dart';
import 'package:ootd/navigation/app_router.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/outfit_provider.dart';
import '../utils/show_confirm_deletion_dialog.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

@RoutePage()
class OutfitOverviewScreen extends ConsumerStatefulWidget {
  final int outfitId;

  const OutfitOverviewScreen({Key? key, required this.outfitId})
      : super(key: key);

  @override
  ConsumerState<OutfitOverviewScreen> createState() =>
      _OutfitOverviewScreenState();
}

class _OutfitOverviewScreenState extends ConsumerState<OutfitOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    int? selectedValue;
    final outfit = ref.watch(getOutfitProvider(widget.outfitId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Outfit Overview'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white70,
            child: IconButton(
              onPressed: () {
                ShareContentManager(outfit.value!.imageUrl).onSharePhotoLink(context);
              },
              icon: Icon(Icons.share),
            ),
          ),
          DropdownButton(
              icon: Icon(Icons.edit),
              value: selectedValue,
              underline: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              items: [
                DropdownMenuItem(value: 1, child: Text('Edit')),
                DropdownMenuItem(value: 2, child: Text('Delete')),
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
                    _showConfirmDeletionDialog(outfitId: widget.outfitId);
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
                Image.network(data.imageUrl),
                Text('Season: ${data.season}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                _buildTagsSection('Tags', data.userTags),
                // Add more fields from your `Outfit` class
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildTagsSection(String title, List<String>? tags) {
    if (tags == null || tags.isEmpty) {
      return Row(
        children: [
          Text('$title: No tags available.'),
          OutlinedButton(onPressed: (){}, child: Text('Add a new tag'))
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
                  child: Row(
                    children: const [
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

