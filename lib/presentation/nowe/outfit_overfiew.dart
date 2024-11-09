import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/data/service/share_content_manager.dart';
import 'package:ootd/model/outfit.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/model/tag.dart';
import 'package:ootd/navigation/app_router.dart';

import '../../utils/show_confirm_deletion_dialog.dart';

@RoutePage()
class OutfitOverviewScreen extends ConsumerStatefulWidget {
  final Outfit outfit;

  const OutfitOverviewScreen({Key? key, required this.outfit})
      : super(key: key);

  @override
  ConsumerState<OutfitOverviewScreen> createState() =>
      _OutfitOverviewScreenState();
}

class _OutfitOverviewScreenState extends ConsumerState<OutfitOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    int? selectedValue;

    return Scaffold(
      appBar: AppBar(
        title: Text('Outfit Overview'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white70,
            child: IconButton(
                onPressed: () {
                  ShareContentManager(widget.outfit.imageUrl).onSharePhotoLink(context);
                },
                icon: Icon(Icons.share),
                ),
          ),
          //SizedBox(width: 6.0),
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
                    context.router.push(EditOutfitDetailsRoute(outfit: widget.outfit));
                    break;
                  case 2:
                    showConfirmDeletionDialog(
                        context: context, ref: ref, outfitId: widget.outfit.id);
                }
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.outfit.imageUrl,
                height: 450,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Season: ${widget.outfit.season}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildTagsSection('User Tags', widget.outfit.userTags),
            _buildTagsSection('Default Tags', widget.outfit.defaultTags),
          ],
        ),
      ),
    );
  }

  //dodac pozniej
  Widget _buildTagsSection(String title, List<Tag>? tags) {
    if (tags == null || tags.isEmpty) {
      return Text('$title: No tags available.');
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
              label: Text(tag.tagName),
            );
          }).toList(),
        ),
      ],
    );
  }
}
