import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/outfit_provider.dart';

void showConfirmDeletionDialog({
  required BuildContext context,
  required WidgetRef ref,
  required int outfitId,
}) {
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
                  ref.read(deleteOutfitProvider(outfitId));
                  ref.read(outfitListNotifierProvider.notifier).removeOutfit(outfitId);
                  context.router.maybePop();
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
